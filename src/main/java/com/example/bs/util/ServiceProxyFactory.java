package com.example.bs.util;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;


import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
@Component
public class ServiceProxyFactory  {
    @Autowired
    private static ApplicationContext context;


    public static <T> T getProxy(Class<T> serviceImpl){
        //这里是service表示真正的目标

        final Object service = context.getBean(serviceImpl);

        return (T) Proxy.newProxyInstance(
            serviceImpl.getClassLoader(),
            serviceImpl.getInterfaces(),
            new InvocationHandler() {
                private Object target = service;
                @Override
                public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
                    //controller条用serviced(代理)的任何方法时
                    //最终都会执行这个invoke方法
                    //方法的method这个参数，就表示的用的代理的哪一个方法进入的invoke
                    //利用这个method参数，调用真正的目标方法
                    //args存储的是在cotroller中，调用service时传递的参数的集合
                    Object result = method.invoke(target,args);
                    return result;
                }
            });
    }


}
