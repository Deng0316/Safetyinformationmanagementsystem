package com.example.bs.service.impl;

import com.example.bs.dao.AuthDao;
import com.example.bs.dao.RoleDao;
import com.example.bs.dao.UserDao;
import com.example.bs.entity.User;
import com.example.bs.service.AuthService;
import com.example.bs.util.StringUtil;
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

}
