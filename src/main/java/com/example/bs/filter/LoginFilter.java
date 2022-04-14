package com.example.bs.filter;

import com.example.bs.entity.User;
import com.example.bs.util.AutoLoginUtil;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginFilter extends HttpFilter {


    protected void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain) throws ServletException, IOException {

        HttpSession session =request.getSession();
        User user = (User) session.getAttribute("loginUser");

        if(user !=null){
            //如果验证通过，将这次请求放过去
            chain.doFilter(request,response);
        }else{
            //可以自动登录
            if(AutoLoginUtil.isAutoLogin(request,response)){
                chain.doFilter(request,response);
                return;
            }
            //不能自动登录
            //验证未通过，给出提示，重新登录
            request.getRequestDispatcher("").forward(request,response);
        }



    }
}
