package com.example.bs.service.impl;

import com.example.bs.dao.RoleDao;
import com.example.bs.entity.Role;
import com.example.bs.service.RoleService;
import com.example.bs.vo.PageVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleDao roleDao;

    @Override
    public PageVo findByPage(Map<String, Object> param) {

        Integer page = (Integer) param.get("page");
        Integer rows = (Integer) param.get("rows");
        long total = roleDao.total((String) param.get("rname"));
        int max = (int) Math.ceil(1.0*total/rows);
        page = Math.min(max,page);
        page = Math.max(1,page);
        int start = (page-1)*rows;
        param.put("start",start);
        param.put("length",rows);
        List<Role> lists = roleDao.list(param);

        return new PageVo(lists,total,rows,page,max,start,start+rows-1,param);
    }

    @Override
    public Role findForEdit(Long rid) {
        return roleDao.findById(rid);
    }

    @Override
    public String save(Role role) {
        long total = roleDao.total(role.getRname());
        if(total>0){
            return "rname";
        }
        roleDao.save(role);
        return "";
    }

    @Override
    public String saves(List<Role> roles) {
        int count1 = 0 ;
        int count2 = 0 ;
        String tip = "" ;
        for(Role role : roles){
            long total = roleDao.total(role.getRname());
            if(total > 0){
                count2++ ;
                tip+="【"+role.getRname()+"】名称重复\\n" ;
                continue;
            }
            count1++ ;
            roleDao.save(role);
        }
        tip = "成功保存【"+count1+"】条记录，失败【"+count2+"】记录\\n" + tip ;
        return tip ;
    }

    @Override
    public String update(Role role) {
        roleDao.update(role);
        long total = roleDao.total(role.getRname());
        if(total>0){
            return "1";
        }
        return "0";
    }

    @Override
    public void delete(Role role) {
        roleDao.delete(role);
    }

    @Override
    public void deletes(Map<String, Object> param) {
//        String rids = (String) param.get("rids");
//        String[] ridArray = rids.split(",");
//        Map<String,Long> deleteParam = new HashMap<>();
//        deleteParam.put("update_rid",(Long)param.get("update_rid"));
//        for(String rid : ridArray ){
//            deleteParam.put("rid",Long.parseLong(rid));
//            roleDao.delete(deleteParam);
//        }
    }


    @Override
    public void enable(long rid) {

    }

    @Override
    public void disable(long rid) {

    }
}
