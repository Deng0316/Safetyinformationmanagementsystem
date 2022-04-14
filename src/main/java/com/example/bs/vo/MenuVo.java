package com.example.bs.vo;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
@AllArgsConstructor
public class MenuVo implements Serializable {
    private Long id;
    private String title;
    private Boolean spread = true;
    private List<MenuVo> children;
}
