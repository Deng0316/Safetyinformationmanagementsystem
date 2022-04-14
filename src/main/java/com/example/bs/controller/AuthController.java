package com.example.bs.controller;


import com.example.bs.entity.User;
import com.example.bs.service.AuthService;
import com.example.bs.service.impl.AuthServiceImpl;
import com.example.bs.util.ServiceProxyFactory;
import com.example.bs.vo.AuthMenuVo;
import com.example.bs.vo.DistributionFunVo;
import com.example.bs.vo.DistributionRoleVo;
import com.example.bs.vo.responseVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/auth")
public class AuthController {


//    private AuthService authService = ServiceProxyFactory.getProxy(AuthServiceImpl.class);

    @Autowired
    private AuthService authService;


    @RequestMapping("/distributionInfoForRole")
    @ResponseBody
    public DistributionRoleVo distributionInfoForRole(@RequestParam("uid") Long uid){

        DistributionRoleVo distributionRoleVo = authService.findDistributionInfoForRole(uid);
        return distributionRoleVo;
    }

    @RequestMapping("/distributionRole")
    @ResponseBody
    public responseVO distributionRole(@RequestParam("uid") Long uid, @RequestParam("ridStr")String ridStr, HttpSession session){

        User loginUser = (User) session.getAttribute("loginUser");
        authService.distributionRole(uid,ridStr,loginUser.getUid());
        try{
            return new responseVO(0,"分配成功");
        }catch (Exception e){
            return new responseVO(1,"未知错误");
        }
    }
    @RequestMapping("/distributionInfoForFun")
    @ResponseBody
    public DistributionFunVo distributionInfoForFun(@RequestParam("rid") Long rid){
        return authService.findDistributionInfoForFun(rid);
    }

    @RequestMapping("/distributionFun")
    @ResponseBody
    public responseVO distributionFun(@RequestParam("rid")Long rid,@RequestParam("fidStr")String fidStr,HttpSession session){
        User user = (User) session.getAttribute("loginUser");
        authService.distributionFun(rid,fidStr,user.getUid());
        try{
            return new responseVO(0,"分配成功");
        }catch (Exception e){
            return new responseVO(1,"未知错误");
        }
    }

    @RequestMapping("/authMenus")
    @ResponseBody
    public List<AuthMenuVo> authMenus(HttpSession session){
        return (List<AuthMenuVo>) session.getAttribute("authMenus");
    }
}
