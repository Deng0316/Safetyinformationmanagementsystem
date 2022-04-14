package com.example.bs.dao;

import com.example.bs.entity.Fun;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;
import java.util.Map;

public interface FunDao {

    List<Fun> findAll();

    @Select("select count(*) from t_fun where fname = #{fname}")
    long total(String fname);

    @Insert("insert into t_fun(fname,ftype,furl,pid,auth_flag,create_time,create_uid,update_time,update_uid,delete_flag,yl1,yl2,yl3,yl4)" +
            "values(#{fname},#{ftype},#{furl},#{pid},#{auth_flag},now(),#{create_uid},#{update_time},#{update_uid},1,#{yl1},#{yl2},#{yl3},#{yl4})")
    void save(Fun fun);


    Fun findById();

    @Update("update t_fun set fname=#{fnema},ftype=#{ftype},furl=#{furl},auth_flag=#{auth_flag},pid=#{pid},pname=#{pname},update_uid=#{update_uid},update_time=now() where fid=#{fid}" )
    void update(Fun fun);

    @Update("update t_fun set update_uid=#{update_uid},update_time=now(),delete_flag=0 where fid=#{fid}")
    void delete(Fun fun);

    @Select("select f.fid,f.fname,f.ftype,f.furl,f.auth_flag,f.pid,if((select fid  from t_role_fun where fid=f.fid and rid=#{rid}),0,1)  LAY_CHECKED from t_fun f where f.delete_flag=1")
    List<Map> findAllByRole(Long rid);

    @Select("select * from t_fun where fid in" +
            "(select fid from t_role_fun where rid in" +
            "(select rid from t_user_role where uid=#{uid}) and rid not in" +
            "(select rid from t_role where delete_flag=1 and yl1=2))")
    List<Fun> findAllByUser(Long uid);

}
