package com.hqyj.seven.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by IntelliJ IDEA.
 * @File ViewController.java
 * @Auth liuxing
 * @Date 2021/8/16 22:58
 * @Email liuxing997@foxmail.com
 */
@Controller
public class ViewController {

    /*登录界面*/
    @RequestMapping("/login")
    public String toLogin(){
        //指向WEB-INF/jsp/index.jsp
        return "login";
    }

    /*没有权限页面*/
    @RequestMapping("/unauthorized")
    public String unauthorized(){
        //指向WEB-INF/jsp/unauthorized.jsp
        return "unauthorized";
    }

    /*后台主页面*/
    @RequestMapping({"/", "/index"})
    public String index(){
        Subject subject = SecurityUtils.getSubject();
        Session session = subject.getSession();
        //如果当前用户没有登录，指向WEB-INF/jsp/login.jsp
        if (session.getAttribute("loginUser") == null || session.getAttribute("loginUser") == "") {
            return "login";
        }
        //指向WEB-INF/jsp/index.jsp
        return "index";
    }

    /*欢迎页面*/
    @RequestMapping("/welcome")
    public String welcome(){
        //指向WEB-INF/jsp/welcome.jsp
        return "welcome";
    }

    //个人信息
    @RequestMapping("/person")
    public String person(){
        //指向WEB-INF/jsp/person.jsp
        return "person";
    }

    /*房间管理*/
    //房间列表
    @RequestMapping("/houseList")
    public String houseList(){
        //指向WEB-INF/jsp/houseList.jsp
        return "houseList";
    }

    /*订房管理*/
    //订房列表
    @RequestMapping("/reservationList")
    public String reservationList(){
        //指向WEB-INF/jsp/reservationList.jsp
        return "reservationList";
    }

    /*入住管理*/
    //入住列表
    @RequestMapping("/checkInList")
    public String checkInList(){
        //指向WEB-INF/jsp/checkInList.jsp
        return "checkInList";
    }

    /*缴费管理*/
    //未缴费列表
    @RequestMapping("/unpaidList")
    public String unpaidList(){
        //指向WEB-INF/jsp/unpaidList.jsp
        return "unpaidList";
    }

    //已缴费列表
    @RequestMapping("/paidList")
    public String paidList(){
        //指向WEB-INF/jsp/paidList.jsp
        return "paidList";
    }

    /*客户管理*/
    //客户列表
    @RequestMapping("/customerList")
    public String customerList(){
        //指向WEB-INF/jsp/customerList.jsp
        return "customerList";
    }

    /*待办管理*/
    //待打扫列表
    @RequestMapping("/cleanList")
    public String cleanList(){
        //指向WEB-INF/jsp/cleanList.jsp
        return "cleanList";
    }

    //待维修列表
    @RequestMapping("/maintainList")
    public String maintainList(){
        //指向WEB-INF/jsp/maintainList.jsp
        return "maintainList";
    }

    /*操作员管理*/
    //操作员列表
    @RequestMapping("/userList")
    public String userList(){
        //指向WEB-INF/jsp/userList.jsp
        return "userList";
    }
}
