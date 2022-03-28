package com.example.bs.entity;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;
import java.util.Date;
@NoArgsConstructor
@Data
@Getter
@Setter
public class Role implements Serializable {
    private Long rid ;
    private String rname ;
    private String description ;
    private Date create_time ;
    private Long create_uid ;
    private Date update_time ;
    private Long update_uid ;
    private Integer delete_flag ;
    private String yl1 ;
    private String yl2 ;

    private String create_uname;
    private String update_uname;
}
