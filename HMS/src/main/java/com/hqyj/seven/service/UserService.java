package com.hqyj.seven.service;

import com.hqyj.seven.pojo.PageData;
import com.hqyj.seven.pojo.User;

import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 *
 * @File UserService.java
 * @Auth liuxing
 * @Date 2021/8/11 16:51
 * @Email liuxing997@foxmail.com
 */
public interface UserService {

    //根据用户名获取用户信息
    User getOneByUsername(String name);

    //根据ID或用户名搜索用户
    List<User> searchUser(String names);

    //查询所有用户
    PageData<User> queryAllUser(int number, int size);

    //操作员登录
    Map<String, Object> login(String username, String password);

    //操作员登出
    Map<String, Object> logout();

    //根据用户ID修改用户信息
    int updateById(User user);

    //根据用户ID删除用户信息
    int deleteById(int id);

    //新增用户
    int insertUser(User user);
}
