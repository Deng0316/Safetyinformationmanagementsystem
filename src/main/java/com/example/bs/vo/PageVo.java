package com.example.bs.vo;

import lombok.Getter;
import lombok.Setter;
import org.apache.ibatis.annotations.ConstructorArgs;
import org.apache.ibatis.annotations.Select;
import org.springframework.context.annotation.ComponentScan;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

public class PageVo implements Serializable {
    private List<?> data;
    private Long total;
    private Integer rows;
    private Integer page;
    private Integer max;
    private Integer start;
    private Integer end;

    public Integer getMax() {
        return max;
    }

    public void setMax(Integer max) {
        this.max = max;
    }

    public Integer getStart() {
        return start;
    }

    public void setStart(Integer start) {
        this.start = start;
    }

    public Integer getEnd() {
        return end;
    }

    public void setEnd(Integer end) {
        this.end = end;
    }

    public List<?> getData() {
        return data;
    }

    public void setData(List<?> data) {
        this.data = data;
    }

    public Long getTotal() {
        return total;
    }

    public void setTotal(Long total) {
        this.total = total;
    }

    public Integer getRows() {
        return rows;
    }

    public void setRows(Integer rows) {
        this.rows = rows;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Map<String, Object> getFilter() {
        return filter;
    }

    public void setFilter(Map<String, Object> filter) {
        this.filter = filter;
    }

    private Map<String,Object> filter;

    public PageVo() {
    }

    public PageVo(List<?> data, Long total, Integer rows, Integer page, Map<String, Object> filter) {
        this.data = data;
        this.total = total;
        this.rows = rows;
        this.page = page;
        this.filter = filter;
    }

    public PageVo(List<?> data, Long total, Integer rows, Integer page, Integer max, Integer start, Integer end, Map<String, Object> filter) {
        this.data = data;
        this.total = total;
        this.rows = rows;
        this.page = page;
        this.max = max;
        this.start = start;
        this.end = end;
        this.filter = filter;
    }
}
