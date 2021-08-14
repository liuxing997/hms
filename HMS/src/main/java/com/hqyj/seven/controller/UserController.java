package com.hqyj.seven.controller;

import com.hqyj.seven.pojo.User;
import com.hqyj.seven.service.UserService;
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

    //根据用户名查询用户
    @RequestMapping("/queryByUsername")
    @ResponseBody
    public Map<String,Object> queryByUsername(String name){
        Map<String, Object> result = new HashMap<>();
        User user = userService.getOneByUsername(name);
        if (user == null){
            result.put("code",-1);
            result.put("message","用户不存在！");
        }else {
            result.put("code",0);
            result.put("data",user);
            result.put("msg","获取数据成功！");
        }
        return result;
    }

    //查询所有用户
    @RequestMapping("/getAllUser")
    @ResponseBody
    public Map<String, Object> getAllUser(){
        List<User> userList =  userService.queryAllUser();
        Map<String, Object> result = new HashMap<>();
        if (userList == null){
            result.put("code",-1);
            result.put("message","用户数据为空！");
        }else {
            result.put("code",0);
            result.put("data",userList);
            result.put("msg","获取数据成功！");
        }
        return result;
    }

    //根据用户ID修改用户信息
    @RequestMapping("/updateById")
    @ResponseBody
    public Map<String, Object> updateById(User user){
        int num =  userService.updateById(user);
        Map<String, Object> result = new HashMap<>();
        if (num == 1){
            result.put("code",200);
            result.put("message","修改成功！");
        }else {
            result.put("code",-1);
            result.put("message","修改失败！");
        }
        return result;
    }

    //根据用户ID删除用户信息
    @RequestMapping("/deleteById")
    @ResponseBody
    public Map<String, Object> deleteById(int id){
        int num =  userService.deleteById(id);
        Map<String, Object> result = new HashMap<>();
        if (num == 1){
            result.put("code",200);
            result.put("message","删除成功！");
        }else {
            result.put("code",-1);
            result.put("message","删除失败！");
        }
        return result;
    }

    //新增用户
    @RequestMapping("/insertUser")
    @ResponseBody
    public Map<String, Object> insertUser(User user){
        int num =  userService.insertUser(user);
        Map<String, Object> result = new HashMap<>();
        if (num == 1){
            result.put("code",200);
            result.put("message","添加成功！");
        }else {
            result.put("code",-1);
            result.put("message","添加失败！");
        }
        return result;
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
