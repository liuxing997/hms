package com.hqyj.seven.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hqyj.seven.dao.UserDao;
import com.hqyj.seven.pojo.PageData;
import com.hqyj.seven.pojo.User;
import com.hqyj.seven.service.UserService;
import com.hqyj.seven.utils.MD5Util;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {

    private UserDao userDao;

    @Autowired
    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    //根据用户名查询操作员
    @Override
    public User getOneByUsername(String name) {
        return userDao.queryByUsername(name);

    }

    //根据ID或用户名搜索操作员
    @Override
    public List<User> searchUser(String names) {
        return userDao.searchUser(names);
    }

    //查询所有操作员
    @Override
    public PageData<User> queryAllUser(int pageNumber, int pageSize) {
        PageHelper.startPage(pageNumber, pageSize);
        List<User> userList = userDao.queryAllUser();
        PageInfo<User> pageInfo = new PageInfo<>(userList);
        //创建数据模型
        PageData<User> pageData = new PageData<>();
        pageData.setCurrentPage(pageNumber);
        //设置每页数
        pageData.setPageSize(pageSize);
        //设置总页数
        pageData.setTotalPage(pageInfo.getPages());
        //设置总记录数
        pageData.setTotalSize((int) pageInfo.getTotal());
        if (pageInfo.isHasNextPage()) {
            //有下一页 设置下一页页码
            pageData.setNextPage(pageInfo.getNextPage());
        } else {
            //没有下一页，设置尾页
            pageData.setNextPage(pageInfo.getPages());
        }
        if (pageInfo.isHasPreviousPage()) {
            //有上一页 设置上一页页码
            pageData.setPreviousPage(pageInfo.getPrePage());
        } else {
            //没有上一页，设置首页
            pageData.setPreviousPage(1);
        }
        //设置操作员信息
        pageData.setList(pageInfo.getList());

        return pageData;
    }

    //根据操作员ID修改操作员信息
    @Override
    public int updateById(User user) {
        //加密操作员密码
        user.setPassword(MD5Util.md5Hash(user.getPassword(), user.getName()));
        return userDao.updateById(user);
    }

    //根据操作员ID删除操作员信息
    @Override
    public int deleteById(int id) {
        return userDao.deleteById(id);
    }

    //新增操作员
    @Override
    public int insertUser(User user) {
        //加密用户密码
        user.setPassword(MD5Util.md5Hash(user.getPassword(), user.getName()));
        return userDao.insertUser(user);
    }


    //操作员登录
    @Override
    public Map<String, Object> login(String name, String password) {
        Map<String, Object> result = new HashMap<>();
        //获取当前操作员
        Subject subject = SecurityUtils.getSubject();
        //判断当前是否已经认证过
        if (!subject.isAuthenticated()) {
            //创建一个认证令牌
            UsernamePasswordToken token = new UsernamePasswordToken(name, password);
            //登录
            try {
                subject.login(token);
            } catch (UnknownAccountException e) {
                //未知账号异常
                result.put("code", -1);
                result.put("message", name + "用户不存在或被禁用");
                return result;
            } catch (IncorrectCredentialsException e) {
                //密码错误异常
                System.out.println(password);
                result.put("code", -2);
                result.put("message", name + "用户密码错误");
                return result;
            } catch (AuthenticationException e) {
                result.put("code", -10);
                result.put("message", "登录失败");
                return result;
            }
        }
        //认证通过，获取已保存在shiro session域中的用户信息
        Session session = subject.getSession();
        Object loginUser = session.getAttribute("loginUser");
        result.put("code", 200);
        result.put("message", "登录成功");
        //直接返回给控制器方法
        result.put("loginUser", loginUser);
        return result;
    }


    //操作员登出
    @Override
    public Map<String, Object> logout() {
        //获取当前操作员
        Subject subject = SecurityUtils.getSubject();
        //操作员登出
        subject.logout();
        //操作员登出移除session中的数据
        Session session = subject.getSession();
        session.removeAttribute("loginUser");
        Map<String, Object> result = new HashMap<>();
        result.put("code", 200);
        result.put("message", "成功登出！");
        return result;
    }
}
