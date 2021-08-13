<%--
  Created by IntelliJ IDEA.
  User: liuxing
  Date: 2021/8/12
  Time: 10:09
  File：login.jsp
  Email: liuxing997@foxmail.com
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<%
    String basePath = request.getContextPath();
%>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>登录｜酒店后台管理系统</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <jsp:include page="common.jsp"/>
    <link rel="stylesheet" href="css/login.css">
</head>
<body class="login-bg">

<div class="login layui-anim layui-anim-up">
    <div class="message">酒店后台管理系统</div>
    <div id="darkbannerwrap"></div>
    <form class="layui-form">
        <input id="name" placeholder="用户名" type="text" lay-verify="required" class="layui-input">
        <hr class="hr15">
        <input id="password" placeholder="密码" type="password" lay-verify="required" class="layui-input">
        <hr class="hr15">
        <div class="code-box">
            <input id="userCode" placeholder="验证码(不区分大小写)" type="text" lay-verify="required"
                   class="layui-input">
            <canvas id="code" width="140" height="43"></canvas>
        </div>
        <hr class="hr15">
        <input value="登录" lay-submit lay-filter="login" style="width:100%;" type="button" onclick="login()">
        <hr class="hr20">
    </form>
</div>
<script type="text/javascript" src="js/code.js"></script>
<script>
    //验证码
    var show_num = [];
    draw(show_num);
    $("#code").on('click', function () {
        draw(show_num);
    });

    //登录
    function login() {
        var userAccount = $("#name").val();
        var userPassword = $("#password").val();
        var userCode = $("#userCode").val();
        if (userAccount.length === 0 && userPassword.length === 0 && userCode.length === 0){
            layer.msg('请先填写完整内容！', {icon: 7, time: 3000});
        }else if (userCode.length === 0){
            layer.msg('验证码不能为空,请重试！', {icon: 7, time: 3000});
        }else if (userAccount.length === 0 || userPassword.length === 0) {
            layer.msg('用户或密码不能为空,请重试！', {icon: 7, time: 3000});
        } else if (!checkCode(show_num, userCode)) {
            layer.msg('验证码不匹配,请重新输入', {icon: 7, time: 3000}, function () {
                draw(show_num);
            });
        } else {
            $.ajax({
                url:"user/login",
                type:"get",
                dataType:"json",
                contentType:"application/x-www-form-urlencoded",//x-www-form-urlencoded
                data:{
                    name:$("#name").val(),
                    password:$("#password").val()
                },
                beforeSend: function () {
                    //显示登录加载提示
                    this.index = layer.load(0, {shade: false, time: 10 * 1000})
                },
                complete: function () {
                    layer.close(this.index);
                },
                success:function (data) {
                    if (data.code === 200 && data.loginUser.name != null ) {
                        // 登录成功
                        layer.msg("欢迎回来，" + data.loginUser.name, {icon: 1, time: 3000}, function () {
                            localStorage.setItem("user",JSON.stringify(data.loginUser));
                            window.location.href = "index.jsp";
                        });
                    }
                },
                error:function (err) {
                    layer.msg('服务器被吃啦！请稍后重试', {icon: 7, time: 3000});
                }
            })
        }
    }

    //匹配验证码
    function checkCode(show_num, code) {
        var str = "";
        for (var i = 0; i < show_num.length; i++) {
            str += show_num[i];
        }
        console.log(code.toUpperCase());
        if (code === str) {
            return true;
        }else if(code.toUpperCase() === str.toUpperCase()){
            return true;
        }else if(code.toLowerCase() === str.toLowerCase()){
            return true;
        }else {
            return false;
        }
    }
</script>
</body>
</html>


