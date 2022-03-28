package com.example.bs.service;

import com.example.bs.entity.Fun;
import com.example.bs.entity.Role;

import java.util.List;

public interface FunService {
    List<Fun> findAll();

    String save(Fun fun);

    Fun edit(Long fid);

    String update(Fun fun);

    void delete(Fun fun);

}
