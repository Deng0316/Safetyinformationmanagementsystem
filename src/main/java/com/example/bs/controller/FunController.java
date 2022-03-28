package com.example.bs.controller;

import com.example.bs.entity.Fun;
import com.example.bs.entity.User;
import com.example.bs.service.impl.FunServicelmpl;
import com.example.bs.util.StringUtil;
import com.example.bs.vo.layuiVo;
import com.example.bs.vo.responseVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/fun")
public class FunController {

    @Autowired
    private FunServicelmpl funService;

    @RequestMapping("/list")
    @ResponseBody
    public layuiVo list(){
        List<Fun> funs = funService.findAll();
        layuiVo vo = new layuiVo();
        vo.setMsg("ok");
        vo.setCode(0);
        vo.setData(funs);
        return vo;
    }

    @RequestMapping("/save")
    @ResponseBody
    public responseVO save(Fun fun, HttpSession session){
        User loginUser = (User) session.getAttribute("loginUser");
        fun.setCreate_uid(loginUser.getUid());
        String result = funService.save(fun);
        if(StringUtil.isEmpty(result)){
            return new responseVO(0,"保存成功");
        }else {
            return new responseVO(1,"用户名重复");
        }
    }

    @RequestMapping("/edit")
    @ResponseBody
    public Fun edit(@RequestParam("fid")Long fid){
        Fun funs = funService.edit(fid);
        return funs;
    }
}
