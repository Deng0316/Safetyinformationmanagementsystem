package com.example.bs.service;

import com.example.bs.entity.Fun;

import java.util.List;

public interface FunService {
    List<Fun> findAll();

    String save(Fun fun);

    Fun edit(Long fid);
}
