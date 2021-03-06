package com.example.bs.controller;

import cn.hutool.core.io.IoUtil;
import cn.hutool.crypto.digest.DigestAlgorithm;
import cn.hutool.crypto.digest.Digester;
import cn.hutool.extra.pinyin.PinyinUtil;
import cn.hutool.poi.excel.ExcelReader;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelWriter;
import com.example.bs.entity.User;
import com.example.bs.service.impl.UserServiceImpl;
import com.example.bs.util.StringUtil;
import com.example.bs.util.TipUtil;
import com.example.bs.vo.PageVo;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import javax.servlet.http.HttpSession;

import org.apache.xmlbeans.impl.xb.xsdschema.Attribute;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import java.nio.charset.StandardCharsets;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;


@Controller
@RequestMapping("/user")
public class UserController {
    public static final Integer DEFAULT_PAGE = 1;
    private static final Integer DEFAULT_ROWS = 10;
    public static final Digester md5 = new Digester(DigestAlgorithm.MD5);

    @Autowired
    private UserServiceImpl userService;

    @RequestMapping("/updatePwd")
    public String updatePwd(@RequestParam("opass")String opass,@RequestParam("upass")String upass,@RequestParam("repass")String repass, HttpSession session){
        if(opass==null||"".equals(opass)){
            return "/view/user/updatePwd.jsp?f=9";
        }
        if(upass==null||"".equals(upass)){
            return "/view/user/updatePwd.jsp?f=9";
        }
        if(repass==null||"".equals(repass)){
            return "/view/user/updatePwd.jsp?f=9";
        }
        User user = (User)session.getAttribute("loginUser");
        if(!user.getUpass().equals(opass)){
            return "/view/user/updatePwd.jsp?f=9";
        }
        if(!upass.equals(repass)){
            return "/view/user/updatePwd.jsp?f=8";
        }
        user.setUpass(upass);
        userService.updatePwd(user.getUid(), md5.digestHex(upass));

        return "/view/user/updatePwdSuccess.jsp";
    }


    @RequestMapping("/list")
    public ModelAndView list(@RequestParam("rows")Integer rows,@RequestParam("page")Integer page,
                             @RequestParam(value = "uname",required = false)String uname,@RequestParam(value = "phone",required = false)String phone){
        if(page==null){
            page = DEFAULT_PAGE;
        }
        if(rows==null){
            page = DEFAULT_ROWS;
        }
        Map<String,Object> param = new HashMap<String,Object>();
        param.put("rows",rows);
        param.put("page",page);
        param.put("uname",uname);
        param.put("phone",phone);

        PageVo vo = userService.list(param);

        ModelAndView mv = new ModelAndView();
        mv.setViewName("/view/user/userlist.jsp");
        mv.addObject("vo",vo);
        return mv;
    }

    @RequestMapping("/save")
    public ModelAndView save(User user,HttpSession session){
        ModelAndView mv = new ModelAndView();
        //??????????????????
        if(StringUtil.isEmpty(user.getUname())){
            mv.setViewName("/view/user/add.jsp?f=uname");
            return mv;
        }
        if(StringUtil.isEmpty(user.getTruename())){
            mv.setViewName("/view/user/add.jsp?f=truename");
            return mv;
        }
        if(StringUtil.isEmpty(user.getSex())){
            mv.setViewName("/view/user/add.jsp?f=sex");
            return mv;
        }
        if(StringUtil.isEmpty(String.valueOf(user.getAge()))){
            mv.setViewName("/view/user/add.jsp?f=age");
            return mv;
        }
        if(StringUtil.isEmpty(user.getPhone())){
            mv.setViewName("/view/user/add.jsp?f=phone");
            return mv;
        }
        if(StringUtil.isEmpty(user.getMail())){
            mv.setViewName("/view/user/add.jsp?f=mail");
            return mv;
        }
        User loginUser = (User) session.getAttribute("loginUser");
       String result = userService.save(user,loginUser.getUid());
       if(StringUtil.isEmpty(result)){
           mv.setViewName("/view/user/addSuccess.jsp");
           return mv;
       }else {
           mv.setViewName("/view/user/add.jsp?f="+result);
           mv.addObject("user",user);
           return mv;
       }
    }

    @RequestMapping("/delete")
    public String delete(@RequestParam("uid")long uid,HttpSession session){
        //??????session???????????????????????????????????????????????????????????????????????????????????????
        User loginUser = (User) session.getAttribute("loginUser");
        Map<String,Long> param = new HashMap<>();
        param.put("uid",uid);
        param.put("update_uid", loginUser.getUid());
            userService.delete(param);
            return TipUtil.tip("????????????","/user/list");

    }

    @RequestMapping("/deletes")
    public String delete(@RequestParam("uids")String uids,HttpSession session){
        //??????session???????????????????????????????????????????????????????????????????????????????????????
        User loginUser = (User) session.getAttribute("loginUser");
        Map<String,Object> param = new HashMap<>();
        param.put("uids",uids);
        param.put("update_uid", loginUser.getUid());
        userService.deletes(param);
        return TipUtil.tip("????????????","/user/list");
    }

    @RequestMapping("/editSelect")
    public ModelAndView editSelect(@RequestParam("uid") Long uid){
        User user = userService.findById(uid);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/view/user/edit.jsp");
        mv.addObject("user",user);
        return mv;
    }

    @RequestMapping("/update")
    public ModelAndView updata(User user,HttpSession session){
        ModelAndView mv = new ModelAndView();
        User loginUser = (User) session.getAttribute("loginUser");
        user.setUpdate_uid(loginUser.getUpdate_uid());
        String result = userService.update(user);
        if(StringUtil.isEmpty(result)){
            mv.setViewName(TipUtil.tip("????????????????????????","/user/list"));
            return mv;
        }else {
            mv.setViewName("/view/user/edit.jsp?f="+result);
            mv.addObject("user",user);
            return mv;
        }
    }

    @RequestMapping("/import")
    public String imports(@RequestParam("excel") MultipartFile excel,HttpSession session) throws IOException {
        User loginUser = (User) session.getAttribute("loginUser");
            //??????excel?????????
            InputStream is = excel.getInputStream();
            //reader????????????????????????  ?????????is?????????
            ExcelReader reader = ExcelUtil.getReader(is);
            //?????????????????????????????????????????????
            reader.addHeaderAlias("?????????","uname");
            reader.addHeaderAlias("????????????","truename");
            reader.addHeaderAlias("??????","age");
            reader.addHeaderAlias("??????","sex");
            reader.addHeaderAlias("??????","phone");
            reader.addHeaderAlias("??????","mail");
            //??????excel????????? ???????????????
            List<User> users = reader.readAll(User.class);
            String tip = userService.saves(users,loginUser.getUid());
            reader.close();
            return TipUtil.tip(tip,"/user/list");
    }

    @RequestMapping("export")
    public void export(HttpServletResponse response) throws IOException {
        //??????????????????
        List<User> users = userService.findAll();
        //??????Hutol?????????users??????excel?????????????????????????????????true xls ???true xlxs
        ExcelWriter writer = ExcelUtil.getWriter(true);
        writer.addHeaderAlias("uid","??????");
        writer.addHeaderAlias("uname","?????????");
        writer.addHeaderAlias("zjm","?????????");
        writer.addHeaderAlias("truename","????????????");
        writer.addHeaderAlias("age","??????");
        writer.addHeaderAlias("sex","??????");
        writer.addHeaderAlias("phone","??????");
        writer.addHeaderAlias("mail","??????");
        writer.addHeaderAlias("create_time","????????????");
        writer.addHeaderAlias("create_uname","?????????");
        writer.addHeaderAlias("update_time","????????????");
        writer.addHeaderAlias("update_uname","?????????");

        writer.setOnlyAlias(true);

        writer.write(users,true);
        //??????????????????
        response.setContentType("application/vnd.ms-excel;charset=utf-8");
        response.setHeader("Content-Disposition","attachment;filename="+new String("????????????.xlsx".getBytes(),"iso-8859-1"));
        OutputStream out=response.getOutputStream();
        writer.flush(out,true);

        writer.close();
        IoUtil.close(out);
    }
}
