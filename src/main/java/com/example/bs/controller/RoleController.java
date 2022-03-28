package com.example.bs.controller;

import cn.hutool.poi.excel.ExcelReader;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelWriter;
import com.example.bs.entity.Role;
import com.example.bs.entity.User;
import com.example.bs.service.impl.RoleServiceImpl;
import com.example.bs.util.StringUtil;
import com.example.bs.util.TipUtil;
import com.example.bs.vo.PageVo;
import com.example.bs.vo.layuiVo;
import com.example.bs.vo.responseVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/role")
public class RoleController {

    @Autowired
    private RoleServiceImpl roleService;

    @RequestMapping(value = "/list")
    @ResponseBody
    public layuiVo list(@RequestParam(value = "page",required = false)Integer page,@RequestParam(value="limit",required = false)Integer limit,@RequestParam(value="rname",required = false)String rname){
        Map<String,Object> params = new HashMap<>();
        if(StringUtil.isEmpty(page)){
            page =1;
        }
        if (StringUtil.isEmpty(limit)){
            limit = 10;
        }
        params.put("page",page);
        params.put("rows",limit);
        params.put("rname",rname);

        PageVo vo = roleService.findByPage(params);
        layuiVo pagevo = new layuiVo();
        pagevo.setCode(0);
        pagevo.setData(vo.getData());
        pagevo.setCount(vo.getTotal());
        pagevo.setMsg("没有任何记录");

        return pagevo;
    }

    @RequestMapping("/save")
    @ResponseBody
    public responseVO save(Role role, HttpSession session){
        User loginUser = (User) session.getAttribute("loginUser");
        role.setCreate_uid(loginUser.getUid());
        String result = roleService.save(role);
        if(StringUtil.isEmpty(result)){
            return new responseVO(0,"保存成功");
        }else {
            return new responseVO(1,"用户名重复");
        }
    }

    @RequestMapping("/edit")
    @ResponseBody
    public Role findById(@RequestParam("rid")Long rid){
        return roleService.findForEdit(rid);
    }

    @RequestMapping("/update")
    @ResponseBody
    public responseVO update(Role role, HttpSession session){
        User loginUser = (User) session.getAttribute("loginUser");
        role.setUpdate_uid(loginUser.getUid());
        String result = roleService.update(role);
        if(StringUtil.isEmpty(result)){
            return new responseVO(1,"修改失败");
        }else {
            return new responseVO(0,"修改成功");
        }
    }

    @RequestMapping("/delete")
    @ResponseBody
    public responseVO delete(@RequestBody List<Role> roleList, HttpSession session){
        User loginUser = (User) session.getAttribute("loginUser");
        for(Role role:roleList){
            role.setUpdate_uid(loginUser.getUid());
            roleService.delete(role);
        }
        return new responseVO(1,"删除成功");
    }

    @RequestMapping("/imports")
    public void imports(@RequestParam("excel") MultipartFile excel, HttpSession session) throws IOException {
        User loginUser = (User) session.getAttribute("loginUser");
        InputStream is = excel.getInputStream();
        ExcelReader reader = ExcelUtil.getReader(is);
        reader.addHeaderAlias("角色名称","rname");
        reader.addHeaderAlias("角色描述","description");
        reader.addHeaderAlias("状态","yl1");
        List<Role> roles = reader.readAll(Role.class);
        for(Role role:roles){
            role.setCreate_uid(loginUser.getUid());
        }
        String tip = roleService.saves(roles);

    }
}

