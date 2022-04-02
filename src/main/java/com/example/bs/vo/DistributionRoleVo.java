package com.example.bs.vo;

import com.example.bs.entity.User;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;
import java.util.Map;
@Data
@AllArgsConstructor
public class DistributionRoleVo implements Serializable {
    private User user;
    private List<Map> roles;
}
