package com.example.bs.service;

import com.example.bs.vo.DistributionFunVo;
import com.example.bs.vo.DistributionRoleVo;

public interface AuthService {

    DistributionRoleVo findDistributionInfoForRole(Long uid);

    void distributionRole(Long uid,String ridStr,Long create_uid);

    DistributionFunVo findDistributionInfoForFun(Long uid);

    void distributionFun(Long rid,String fidStr,Long create_uid);
}
