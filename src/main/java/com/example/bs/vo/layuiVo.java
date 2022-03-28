package com.example.bs.vo;

import java.io.Serializable;
import java.util.List;

public class layuiVo implements Serializable {
    public List<?> getData() {
        return data;
    }

    public void setData(List<?> data) {
        this.data = data;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public Long getCount() {
        return count;
    }

    public void setCount(Long count) {
        this.count = count;
    }

    public layuiVo(List<?> data, String msg, Integer code, Long count) {
        this.data = data;
        this.msg = msg;
        this.code = code;
        this.count = count;
    }

    public layuiVo() {
    }

    private List<?> data;
    private String msg;
    private Integer code;
    private Long count;
}
