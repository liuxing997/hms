package com.hqyj.seven.dao;

import com.hqyj.seven.pojo.User;

/**
 * Created by IntelliJ IDEA.
 * @File UserDao.java
 * @Auth liuxing
 * @Date 2021/8/11 16:52
 * @Email liuxing997@foxmail.com
 */
public interface UserDao {
   User queryByUsername(String name);
}
