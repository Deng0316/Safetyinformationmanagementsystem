package com.example.bs.util;

import com.example.bs.controller.RoleController;
import com.example.bs.dao.FunDao;
import com.example.bs.dao.UserDao;
import com.example.bs.entity.Fun;
import com.example.bs.entity.User;
import com.example.bs.vo.AuthMenuVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;


@Component
public class AutoLoginUtil {
    @Autowired
    private FunDao funDao;

    @Autowired
    private static FunDao staticFunDao;

    @Autowired
    private UserDao userDao;

    @Autowired
    private static UserDao staticUserDao;

    @PostConstruct
    public void into(){
        staticUserDao = userDao;
        staticFunDao = funDao;
    }
    public static boolean isAutoLogin(HttpServletRequest request, HttpServletResponse response){

        Cookie[] cookies = request.getCookies();
        if (cookies == null){
            return false;
        }
        for(Cookie cookie:cookies){
            if("tokenId".equals( cookie.getName())){
                //找到了cookie信息
                String tokenId = cookie.getValue();
                long time = Long.parseLong(tokenId.split("-")[1]);
                //找对应的登录信息
                Long uid = (Long) request.getServletContext().getAttribute(tokenId);
                User user = staticUserDao.findById(uid);
                if(uid == null){
                    //没有tokenId找到登录信息
                    //可能是伪造的token 可能是缓存信息消失
                    response.setHeader("auto-login-info","auto login fail");
                    return false;
                }
                Long curr = System.currentTimeMillis();
                Long day = (curr - time)/1000/60/60/24;
                if(day>7){
                    response.setHeader("auto-login-info","auto login fail");
                    return false;
                }
                if(user==null){
                    response.setHeader("auto-login-info","auto login fail");
                    return false;
                }
                //这时候可以自动登录，要将登录信息存入session
                addLoginUser(user, request.getSession());
                return true;
            }
        }
        //没有自动登录的cookie信息，不能自动登录
        return false;
    }

    public static void addLoginUser(User user, HttpSession session){
        session.setAttribute("loginUser",user);

        //获得用户的权限信息
        List<Fun> funs = staticFunDao.findAllByUser(user.getUid());
        List<AuthMenuVo> authMenuVos = handleAuthMenu(funs);
        session.setAttribute("authMenus",authMenuVos);

        //接下来找用户的所有权限标识
        Set<String> menuAuths = loadAuthFlag(funs);
    }
    private static Set<String> loadAuthFlag(List<Fun> authFuns){
        Set<String> auths = new HashSet<>();
        for(Fun fun:authFuns){
            if(fun.getFtype().equals(2)){
                auths.add(fun.getAuth_flag());
            }
        }
        return auths;
    }

    private static List<AuthMenuVo> handleAuthMenu(List<Fun> authFuns){
        return handlerAuthMenuPreLevel(-1L,authFuns);
    }

    private static List<AuthMenuVo> handlerAuthMenuPreLevel(Long pid,List<Fun> authFuns){
        List<AuthMenuVo> authMenuVos = new ArrayList<>();
        for(Fun fun : authFuns){
            if(fun.getFtype().equals(1)&&fun.getPid().equals(pid)){
                //找到了这一层的一个菜单，组成AuthMenuVo
                AuthMenuVo authMenuVo = new AuthMenuVo();
                authMenuVo.setFname(fun.getFname());
                authMenuVo.setFurl(fun.getFurl());
                //需要找到当前这个Fun菜单的子级菜单
                List<AuthMenuVo> chj = handlerAuthMenuPreLevel(fun.getFid(), authFuns);
                authMenuVo.setChildren(chj);
                authMenuVos.add(authMenuVo);
            }
        }
        return authMenuVos;
    }
}
