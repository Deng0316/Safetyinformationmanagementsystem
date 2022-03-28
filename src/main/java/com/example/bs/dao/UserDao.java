package com.example.bs.dao;


import com.example.bs.entity.User;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;
@Mapper
public interface UserDao {
    @Select("select * from t_user where uname=#{uname} or zjm=#{uname} or phone=#{uname} or mail=#{uname}")
    public User findByUname(String uname);

    @Select("select count(*) from t_user where uname=#{uname} or zjm=#{uname} or phone=#{uname} or mail=#{uname}")
    public Integer TotalByUname(String uname);

    @Select("select uid,uname,upass,zjm,phone,mail,truename,sex,age,create_time,create_uid,update_time,update_uid,delete_flag,yl1,yl2,yl3,yl4 from t_user where uid=#{uid}")
    public User findById(Long uid);

    @Update("update t_user set upass=#{upass},update_time=now(),update_uid=#{uid} where uid=#{uid}")
    public void updatePwd(@Param("uid")long uid ,@Param("upass") String upass);

    public long listTotal(Map<String,Object> param);

    public List<User> list(Map<String,Object> param);

    @Select("select count(*) from t_user where uname=#{uname} or zjm=#{uname} or phone=#{uname} or mail=#{uname}")
    public long find(String uname);

    public void save(User user);

    @Update("update t_user set delete_flag=2,update_time=now(),update_uid=#{update_uid} where uid=#{uid}")
    public void delete(Map<String,Long> param);

    @Update("update t_user set truename=#{truename},age=#{age},phone=#{phone},mail=#{mail},sex=#{sex},update_time=now(),update_uid=#{update_uid} where uid=#{uid}")
    public void update(User user);

    public List<User> findAll();
}
