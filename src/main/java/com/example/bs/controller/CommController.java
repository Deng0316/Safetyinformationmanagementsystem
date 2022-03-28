package com.example.bs.controller;

import cn.hutool.captcha.CaptchaUtil;
import cn.hutool.captcha.LineCaptcha;
import cn.hutool.crypto.digest.DigestAlgorithm;
import cn.hutool.crypto.digest.Digester;
import com.example.bs.dao.UserDao;
import com.example.bs.entity.User;
import com.example.bs.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.OutputStream;
import java.util.UUID;

import static com.example.bs.controller.UserController.md5;


@Controller
public class CommController {

    private static final int VERCODE_ERROR = 9;
    private static final int UNAME_ERROR = 8;
    private static final int UPASS_ERROR = 7;

    @Autowired
    private UserServiceImpl userService;


    @RequestMapping("/verifyCode")
    public void verifyCode(HttpServletResponse resp , HttpSession session) throws IOException {

        LineCaptcha lineCaptcha = CaptchaUtil.createLineCaptcha(120, 40,4,30);
        String code = lineCaptcha.getCode() ;
        //System.out.println(code);
        session.setAttribute("code",code);

        //我们的验证码的图片不需要存储在本地，而是需要响应给浏览器
        OutputStream os = resp.getOutputStream();
        lineCaptcha.write(os);
        os.flush();

    }
//redirect:  重定向
    @RequestMapping("/login")
    public String login(@RequestParam("username")String username,
                      @RequestParam("password")String password,
                      @RequestParam("vercode")String vercode,
                      HttpSession session/*@RequestParam("remember")String remember,
                        HttpServletResponse response,HttpServletRequest request*/
    ){

        String code = (String)session.getAttribute("code");
        if(!vercode.equals(code)){
            return reloadLoginUrl(VERCODE_ERROR);
        }
        User user = userService.findByUname(username);
        if(user==null){
            return reloadLoginUrl(UNAME_ERROR);
        }
        if(!user.getUpass().equals(md5.digestHex(password))){
            return reloadLoginUrl(UPASS_ERROR);
        }
        session.setAttribute("loginUser",user);
//        executeAutoLogin(remember,user.getUid(),response,request);
        return "main.jsp";
    }
    private String reloadLoginUrl(int code){
        return "login.jsp?f="+code;
    }

//    private void executeAutoLogin(String remember,long uid,HttpServletResponse response, HttpServletRequest request){
//        if(remember==null && "".equals(remember)){
//            return;
//        }
//        String tokenId = UUID.randomUUID().toString().replace("-","");
//        Cookie cookie = new Cookie("tokenId",tokenId);
//        cookie.setMaxAge(30);
//        response.addCookie(cookie);
//        ServletContext application = request.getServletContext();
//        application.setAttribute(tokenId,uid);
//    }

    @RequestMapping("/exit")
    public String exit(HttpSession session){
        session.invalidate();
        return "login.jsp";
    }

}
