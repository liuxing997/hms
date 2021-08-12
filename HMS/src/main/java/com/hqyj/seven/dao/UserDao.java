package com.hqyj.seven.dao;

import com.hqyj.seven.pojo.User;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * @File UserDao.java
 * @Auth liuxing
 * @Date 2021/8/11 16:52
 * @Email liuxing997@foxmail.com
 */
public interface UserDao {

   //根据用户名查询用户信息
   User queryByUsername(String name);

   //查询所有用户信息
   List<User> queryAllUser();

   //根据用户ID修改用户信息
   int updateById(User user);
}
