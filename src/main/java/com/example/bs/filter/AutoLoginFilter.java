package com.example.bs.filter;


import com.example.bs.util.AutoLoginUtil;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebFilter({"/login.jsp", "/login"})
public class AutoLoginFilter extends HttpFilter {
    @Override
    public void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain) throws ServletException, IOException {
        if(AutoLoginUtil.isAutoLogin(request,response)){
            request.getRequestDispatcher("/main.jsp").forward(request,response);
            return;
        }
        chain.doFilter(request,response);
    }
}
