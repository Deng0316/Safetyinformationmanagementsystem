package com.example.bs.dao;

import com.example.bs.entity.Fun;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

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
}
