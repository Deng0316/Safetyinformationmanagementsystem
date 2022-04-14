package com.example.bs.vo;

import com.example.bs.entity.Role;
import lombok.Data;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

@Data
public class DistributionFunVo implements Serializable {
    private Role role;
    private List<Map> funs;

    public DistributionFunVo(Role role, List<Map> funs) {
        this.role = role;
        this.funs = funs;
    }
}
