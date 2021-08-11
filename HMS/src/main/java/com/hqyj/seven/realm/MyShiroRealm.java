package com.hqyj.seven.realm;


import com.hqyj.seven.pojo.User;
import com.hqyj.seven.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashSet;
import java.util.Set;

/*
*   认证域
*   给shiro框架返回系统中用户的认证信息
*   给shiro框架返回系统中用户的授权信息
* */
public class MyShiroRealm extends AuthorizingRealm {

    @Autowired
    private UserService userService;

    //给shiro框架返回系统中待认证用户的认证信息
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        //使用认证令牌获取当前待登录的用户名
        String username = (String)token.getPrincipal();
        //在我们的系统中查询用户的认证信息
        User user = userService.getOneByUsername(username);
        //如果用户不存在，抛出用户不存在的异常
        if(user == null){
            throw new UnknownAccountException(username+"不存在");
        }
        //在shiro会话域中共享用户信息，以便业务层获取使用
        Session session = SecurityUtils.getSubject().getSession();
        session.setAttribute("loginUser", user);
        //使用三个参数的构造方法来构造，用户名、密码、当前认证域的名称
//        SimpleAuthenticationInfo info =
//                new SimpleAuthenticationInfo(username, user.getPassword(), getName());
      ByteSource saltBytes =ByteSource.Util.bytes(user.getName());
        SimpleAuthenticationInfo info =
              new SimpleAuthenticationInfo(username, user.getPassword(), saltBytes,getName());
        System.out.println("获取认证信息");
        System.out.println(info);
        return info;
    }
   //给shiro框架返回系统中的信息
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {

        return null;
    }


}
