package com.example.bs.vo;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
public class AuthMenuVo implements Serializable {
    private Long fid;
    private String fname;
    private String furl;
    private List<AuthMenuVo> children;
}
