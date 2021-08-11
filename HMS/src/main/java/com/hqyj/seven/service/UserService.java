package com.hqyj.seven.service;

import com.hqyj.seven.pojo.User;

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
    Map<String, Object> login(String username, String password);
}
