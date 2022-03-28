package com.example.bs.service;

import com.example.bs.entity.Role;
import com.example.bs.vo.PageVo;

import java.util.List;
import java.util.Map;

public interface RoleService {
    PageVo findByPage(Map<String,Object> param);

    Role findForEdit(Long rid);

    String save(Role role);

    String saves(List<Role> roles);

    String update(Role role);

    void delete(Role role);

    void deletes(Map<String,Object> param);

    void enable(long rid);

    void disable(long rid);
}
