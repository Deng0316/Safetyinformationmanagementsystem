package com.example.bs.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
@NoArgsConstructor
@Data
public class Fun {
    private Long fid ;
    private String fname ;
    private Integer ftype ;
    private String furl ;
    private Long pid ;
    private String auth_flag ;
    private Date create_time ;
    private Long create_uid ;
    private Date update_time ;
    private Long update_uid ;
    private Integer delete_flag ;
    private String yl1 ;
    private String yl2 ;
    private String yl3 ;
    private String yl4 ;
    private String create_uname;
    private String update_uname;
    private String pname;
}
