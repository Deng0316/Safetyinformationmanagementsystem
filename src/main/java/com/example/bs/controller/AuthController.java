package com.example.bs.controller;


import com.example.bs.entity.User;
import com.example.bs.service.AuthService;
import com.example.bs.service.impl.AuthServiceImpl;
import com.example.bs.vo.DistributionRoleVo;
import com.example.bs.vo.responseVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/auth")
public class AuthController {

    @Autowired
    private AuthServiceImpl authService;

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
        return new responseVO(0,"分配成功");
    }
}
