package com.example.bs.service.impl;

import com.example.bs.dao.AuthDao;
import com.example.bs.dao.FunDao;
import com.example.bs.dao.RoleDao;
import com.example.bs.dao.UserDao;
import com.example.bs.entity.Role;
import com.example.bs.entity.User;
import com.example.bs.service.AuthService;
import com.example.bs.util.StringUtil;
import com.example.bs.vo.DistributionFunVo;
import com.example.bs.vo.DistributionRoleVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Service
public class AuthServiceImpl implements AuthService {

    @Autowired
    private UserDao userDao;

    @Autowired
    private AuthDao authDao;

    @Autowired
    private RoleDao roleDao;

    @Autowired
    private FunDao funDao;

    @Override
    public DistributionRoleVo findDistributionInfoForRole(Long uid) {
        User user = userDao.findById(uid);
        List<Map> roles = roleDao.findAllByUser(uid);
        return new DistributionRoleVo(user,roles);
    }

    @Override
    public void distributionRole(Long uid, String ridStr, Long create_uid) {
        authDao.removeRelationshipForUserAndRole(uid);
        if(StringUtil.isEmpty(ridStr)){
            return;
        }
        Map<String,Object>param = new HashMap<>();
        param.put("uid",uid);
        param.put("create_uid",create_uid);
        String[] array = ridStr.split(",");
        for(String rid:array){
            param.put("rid",Long.parseLong(rid));
            authDao.addRelationshipForUserAndRole(param);
        }
    }

    @Override
    public DistributionFunVo findDistributionInfoForFun(Long rid) {
        Role role = roleDao.findById(rid);
        List<Map> funs = funDao.findAllByRole(rid);
        return new DistributionFunVo(role,funs);
    }

    @Override
    public void distributionFun(Long rid, String fidStr, Long create_uid) {
        authDao.removeRelationshipForRoleAndFun(rid);
        if(StringUtil.isEmpty(fidStr)){
            return;
        }
        String[] fidArray = fidStr.split(",");
        Map<String,Object> param = new HashMap<>();
        param.put("rid",rid);
        param.put("create_uid",create_uid);
        for (String fid:fidArray){
            param.put("fid",Long.parseLong(fid));
            authDao.addRelationshipForRoleAndFun(param);
        }
    }

}
