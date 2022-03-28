package com.example.bs.service.impl;

import com.example.bs.dao.FunDao;
import com.example.bs.entity.Fun;
import com.example.bs.service.FunService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class FunServicelmpl implements FunService {

    @Autowired
    private FunDao funDao;


    @Override
    public List<Fun> findAll() {
        return funDao.findAll();
    }

    @Override
    public String save(Fun fun) {
        long total = funDao.total(fun.getFname());
        if(total>0){
            return "1";
        }
        funDao.save(fun);
        return "";
    }

    @Override
    public Fun edit(Long fid) {
        return funDao.findById();
    }
}
