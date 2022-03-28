package com.example.bs.test;


import com.example.bs.entity.Role;
import com.example.bs.service.impl.RoleServiceImpl;
import com.example.bs.vo.PageVo;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class test1 {


    @Test
    public void testTotal(){
        RoleServiceImpl roleService = new RoleServiceImpl();
        Map<String,Object> param = new HashMap<>();
        param.put("start",0);
        param.put("length",10);
        PageVo vo = roleService.findByPage(param);
        List lists = vo.getData();
        for(Object list:lists){
            System.out.println(list);
        }
    }
    @Test
    public void testlist() {
//        Map<String, Object> param = new HashMap<>();
//        param.put("start", 0);
//        param.put("length", 2);
//        param.put("rname", "");
//        List<Role> roles = dao.list(param);
    }
    @Test
    public void testsave(){

    }
    @Test
    public void testupdate(){

    }
    @Test
    public void testdelete(){

    }
}
