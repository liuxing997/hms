package com.hqyj.seven.controller;

import com.hqyj.seven.service.UserService;
import com.hqyj.seven.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * @File UserController.java
 * @Auth liuxing
 * @Date 2021/8/11 16:52
 * @Email liuxing997@foxmail.com
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/getAll")
    public String getAllUser(){

        return "success";
    }

    //操作员登录
    @RequestMapping("/login")
    @ResponseBody
    public Map<String, Object> login(String  name, String password){
        //检查请求参数
        if(name == null || password == null){
            Map<String, Object> result = new HashMap<>();
            result.put("code",-9);
            result.put("message","请求参数错误");
            return result;
        }
        //调用服务层实现业务
        return userService.login(name,password);
    }

    //用户登出
    @RequestMapping("/logout")
    @ResponseBody
    public Map<String,Object> logout(){
        //调用服务层实现业务
        return userService.logout();
    }

}
