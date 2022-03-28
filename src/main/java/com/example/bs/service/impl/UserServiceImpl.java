package com.example.bs.service.impl;

import cn.hutool.extra.pinyin.PinyinUtil;
import com.example.bs.dao.UserDao;
import com.example.bs.entity.User;
import com.example.bs.service.UserService;
import com.example.bs.vo.PageVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.example.bs.controller.UserController.md5;

@Service
public class UserServiceImpl implements UserService {
    private static final String DEFAULT_PASS ="123";

    @Autowired
    private UserDao userDao;
    @Override
    public User findByUname(String uname) {
        return userDao.findByUname(uname);
    }

    @Override
    public void updatePwd(long uid, String upass) {
         userDao.updatePwd(uid,upass);
    }

    @Override
    public PageVo list(Map<String, Object> param) {
        //分页模块
        Integer page = (Integer) param.get("page");
        Integer rows = (Integer) param.get("rows");
        //下限
        //如果page小于1 则page等于1 如果page大于一 则下限就是page
        page = Math.max(1,page);


        //获取total 总共查询的数量
        long total = userDao.listTotal(param);
        //计算出页数
        long max = total%rows==0?total/rows:(total/rows+1);
        //至少
        max = Math.max(1,max);
        //上限
        page = (int)Math.min(page,max);
        //将获得的页数存回map
        param.put("page",page);

        int start = (page-1)*rows;
        int length = rows;
        param.put("start",start);
        param.put("length",length);

        List<User> users = userDao.list(param);
        return new PageVo(users,total,rows,page,param);
    }

    @Override
    public String save(User user,Long create_uid)  {
        //获取助记码
        String zjm = PinyinUtil.getPinyin(user.getUname(),"");
        user.setZjm(zjm);
        //设置一个默认的密码并加密
        String upass = md5.digestHex(DEFAULT_PASS);
        user.setUpass(upass);
        //获得创建者的UID
        user.setCreate_uid(create_uid);
        //获得创建时的时间
        user.setCreate_time(new Date());
        user.setDelete_flag(1);
        //校验 判断账号是否存在
        if(userDao.find(user.getUname())>0){
            return "uname";
        }
        if(userDao.find(user.getZjm())>0){
            return "zjm";
        }
        if(userDao.find(user.getPhone())>0){
            return "phone";
        }
        if(userDao.find(user.getMail())>0){
            return "mail";
        }
        // 判断 账号不存在 可以保存后调用保存方法
        userDao.save(user);
        return "";
    }

    @Override
    public void delete(Map<String, Long> param) {
        userDao.delete(param);
    }

    @Override
    public void deletes(Map<String, Object> param) {
        String uids = (String) param.get("uids");
        String[] uidArray = uids.split(",");
        Map<String,Long> deleteParam = new HashMap<>();
        deleteParam.put("update_uid",(Long)param.get("update_uid"));
        for(String uid : uidArray ){
            deleteParam.put("uid",Long.parseLong(uid));
            userDao.delete(deleteParam);
        }
    }

    @Override
    public String update(User user) {
        User old = userDao.findById(user.getUid());
        if(!user.getPhone().equals(old.getPhone())){
            //和当前账号的旧手机号不一致再去判断与数据库中其他电话是否一致
            if(userDao.TotalByUname(user.getPhone())>0){
                return "phone";
            }
        }
        if(!user.getMail().equals(old.getMail())){
            if(userDao.TotalByUname(user.getMail())>0){
                return "mail";
            }
        }
        userDao.update(user);
        return null;
    }

    @Override
    public String saves(List<User> users,Long create_uid) {
        String tip = "";
        int i = 1;
        int count1 = 0;
        int connt2 = 0;
        for(User user:users){
            String result = this.save(user,create_uid);
            switch (result){
                case "uname" :connt2++; tip+="第【"+i+"】条数据，用户名【"+user.getUname()+"】重复\\n";break;
                case "zjm" :connt2++; tip+="第【"+i+"】条数据，助记码【"+user.getZjm()+"】重复\\n";break;
                case "phone" :connt2++; tip+="第【"+i+"】条数据，电话【"+user.getPhone()+"】重复\\n";break;
                case "mail" :connt2++; tip+="第【"+i+"】条数据，邮箱【"+user.getMail()+"】重复\\n";break;
                default:count1++;break;
            }
            i++;
        }
        tip = "此次成功保存【"+count1+"】条记录，失败【"+connt2+"】条记录\\n"+tip;
        return tip;
    }

    public User findById(Long uid){
        return userDao.findById(uid);
    }

    public List<User> findAll(){
        return userDao.findAll();
    }


}
