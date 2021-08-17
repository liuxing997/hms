<%--
  Created by IntelliJ IDEA.
  User: liuxing
  Date: 2021/8/17
  Time: 09:37
  File：unauthorized.jsp
  Email: liuxing997@foxmail.com
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>没有权限访问此页面｜酒店后台管理系统</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <%--  引入公共样式和脚本文件  --%>
    <jsp:include page="common.jsp"/>
</head>
<style>
    a {
        color: green;
        text-decoration: none;
    }

    a:hover {
        color: blue;
    }
</style>
<body>
<div class="layui-container">
    <div class="fly-panel">
        <div class="fly-none">
            <h2><i class="layui-icon layui-icon-face-surprised"></i></h2>
            <p>您没有权限访问该页面哦！啥都看不到......您可以<a href="javascript:" onclick="reLogin()"> 换个账户登录</a>
                或<a href="http://mail.qq.com/cgi-bin/qm_share?t=qm_mailme&email=1747411761@qq.com">联系管理员</a>!</p>
        </div>
    </div>
</div>
<script>
    function reLogin() {
        //移除浏览器本地存储的数据
        localStorage.removeItem("user");
        //退出当前用户登录
        location.href = "user/logout";
        //回到登录页面
        window.location.href = "login";
    }
</script>
</body>
</html>
