package com.example.bs.dao;

import com.example.bs.entity.Role;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;
import java.util.Map;

public interface RoleDao {
    long total(String rname);

    List<Role> list(Map<String,Object> params);

    void save(Role role);

    Role findById(Long rid);

    @Update("update t_role set rname=#{rname},description=#{description},update_time=now(),update_uid=#{update_uid},yl1=#{yl1}  where rid=#{rid}")
    void update(Role role) ;

    @Update("update t_role set delete_flag=2,update_time=now(),update_uid=#{update_uid} where rid=#{rid}")
    void delete(Role role);

    @Select("select r.rid,r.rname,r.description,r.yl1,ifnull(ur.uid,0) LAY_CHECKED from t_role r left join t_user_role ur on r.rid = ur.rid and ur.rid = #{uid} order by ur.uid desc ,r.rid")
    List<Map> findAllByUser(Long uid);


}
