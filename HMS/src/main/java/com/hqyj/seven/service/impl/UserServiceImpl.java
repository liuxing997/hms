package com.hqyj.seven.service.impl;

import com.hqyj.seven.dao.UserDao;
import com.hqyj.seven.pojo.User;
import com.hqyj.seven.service.UserService;
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
    @Autowired
    private UserDao userDao;

    //根据用户名查询用户
    @Override
    public User getOneByUsername(String  name) {
        return userDao.queryByUsername(name);

    }

    //查询所有用户
    @Override
    public List<User> queryAllUser() {
        return userDao.queryAllUser();
    }

    //根据用户ID修改用户信息
    @Override
    public int updateById(User user) {
        return userDao.updateById(user);
    }

    //操作员登录
    @Override
    public Map<String, Object> login(String  name, String password) {
        Map<String, Object> result = new HashMap<>();
        //获取当前用户
        Subject subject = SecurityUtils.getSubject();
        //判断当前是否已经认证过
        if(!subject.isAuthenticated()){
            //创建一个认证令牌
            UsernamePasswordToken token = new UsernamePasswordToken( name,password);
            //登录
            try{
                subject.login(token);
            }catch (UnknownAccountException e){
                //未知账号异常
                result.put("code", -1);
                result.put("message",name+"用户不存在");
                return result;
            }catch (IncorrectCredentialsException e){
                //密码错误异常
                System.out.println(password);
                result.put("code", -2);
                result.put("message", name+"用户密码错误");
                return result;
            }
            catch (AuthenticationException e){
                result.put("code",-10);
                result.put("message","登录失败");
                return result;
            }
        }
        //认证通过，获取已保存在shiro session域中的用户信息
        Session session = subject.getSession();
        Object loginUser = session.getAttribute("loginUser");
        result.put("code", 200);
        result.put("message", "登录成功");
        //直接返回给控制器方法
        result.put("loginUser",loginUser);
        return result;
    }


    //操作员登出
    @Override
    public Map<String, Object> logout() {
        //获取当前操作员
        Subject subject =  SecurityUtils.getSubject();
        //操作员登出
        subject.logout();
        //操作员登出移除session中的数据
        Session session = subject.getSession();
        session.removeAttribute("loginUser");
        Map<String,Object> result = new HashMap<>();
        result.put("code",200);
        result.put("message","成功登出！");
        return result;
    }
}
