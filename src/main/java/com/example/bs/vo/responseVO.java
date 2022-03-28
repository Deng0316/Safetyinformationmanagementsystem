package com.example.bs.vo;

import java.io.Serializable;

public class responseVO implements Serializable {
    private Integer code;
    private String msg;

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public responseVO(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public responseVO() {
    }
}
