package com.example.bs.util;

public class TipUtil {

    public static String tip(String msg , String url){
        return "/commonTip.jsp?msg="+msg+"&url="+url ;
    }

//    public static void main(String[] args) {
//        System.out.println(tip("删除成功","/user/list"));
//    }

}
