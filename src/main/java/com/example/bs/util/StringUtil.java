package com.example.bs.util;

public class StringUtil {
    public static boolean isEmpty(String s){
        return s == null || "".equals(s);
    }

    public static boolean isEmpty(Integer s){
        return s == null || "".equals(s);
    }

    public static boolean isEmpty(Long s){
        return s == null || "".equals(s);
    }
//    public static boolean isNotEmpty(String s){
//        return !isEmpty(s);
//    }
}
