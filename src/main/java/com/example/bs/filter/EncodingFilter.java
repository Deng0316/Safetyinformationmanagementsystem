package com.example.bs.filter;

import javax.servlet.*;
import java.io.IOException;

public class EncodingFilter implements Filter {


    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
        req.setCharacterEncoding("utf-8");
        chain.doFilter(req,res);
    }
}
