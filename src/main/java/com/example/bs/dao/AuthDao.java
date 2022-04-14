package com.example.bs.dao;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;

import java.util.Map;

public interface AuthDao {

    @Delete("delete from t_user_role where uid = #{uid}")
    void removeRelationshipForUserAndRole(Long uid);

    @Insert("insert into t_user_role(uid,rid,create_time,create_uid)" +
            "values (#{uid},#{rid},now(),#{create_uid})")
    void addRelationshipForUserAndRole(Map<String,Object> param);

    @Delete("delete from t_role_fun where rid = #{rid}")
    void removeRelationshipForRoleAndFun(Long rid);

    @Insert("insert into t_role_fun(rid,fid,create_time,create_uid)" +
            "values (#{rid},#{fid},now(),#{create_uid})")
    void addRelationshipForRoleAndFun(Map<String,Object> param);
}
