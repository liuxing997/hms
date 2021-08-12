package com.hqyj.seven.service;

import com.hqyj.seven.pojo.User;

import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * @File UserService.java
 * @Auth liuxing
 * @Date 2021/8/11 16:51
 * @Email liuxing997@foxmail.com
 */
public interface UserService {
    //根据用户名获取用户信息
    User   getOneByUsername(String  name);

    //查询所有用户
    List<User> queryAllUser();

    //登录
    Map<String, Object> login(String username, String password);

    //用户登出
    Map<String,Object> logout();

    //根据用户ID修改用户信息
    int updateById(User user);
}
