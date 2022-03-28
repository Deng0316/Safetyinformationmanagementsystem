package com.example.bs.service;


import com.example.bs.dao.UserDao;
import com.example.bs.entity.User;
import com.example.bs.vo.PageVo;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Map;

public interface UserService {



    public User findByUname(String uname);

    public void updatePwd(long uid , String upass);

    public PageVo list(Map<String,Object> param);


    /**
     * @Param user
     * @return null or "" 的时候表示保存成功
     *         “uname” 的时候表示用户名重复
     *         “zjm”   的时候表示助记码重复
     *         “phone”，“mail” 以此类推
     */
    public String save(User user,Long create_uid);

    /**
     * @Param param (uid,update_uid)
     */
    public void delete(Map<String,Long> param);
    /**
     * @Param param (uids,update_uid)
     */
    public void deletes(Map<String,Object> param);

    /**
     * @Param user
     * @return null or "" 的时候表示修改成功
     *         “phone” 的时候表示电话重复
     *         “mail”   的时候表示邮箱重复
     *
     */
    public String update(User user);

    public String saves(List<User> users,Long create_uid);

    public List<User> findAll();



}
