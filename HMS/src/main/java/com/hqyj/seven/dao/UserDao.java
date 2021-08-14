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

   //根据ID或用户名搜索用户
   List<User>  searchUser(String names);

   //查询所有用户信息
   List<User> queryAllUser();

   //根据用户ID修改用户信息
   int updateById(User user);

   //根据用户ID删除用户信息
   int deleteById(int id);

   //新增用户
   int insertUser(User user);
}
