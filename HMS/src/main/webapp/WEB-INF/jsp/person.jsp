<%--
  Created by IntelliJ IDEA.
  User: liuxing
  Date: 2021/8/13
  Time: 21:38
  File：person.jsp
  Email: liuxing997@foxmail.com
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>个人信息｜酒店后台管理系统</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <%--  引入公共样式和脚本文件  --%>
    <jsp:include page="common.jsp"/>
</head>
<body>
<div class="layui-card">
    <div class="layui-card-body">
        <form class="layui-form" id="person">
            <div class="layui-form-item">
                <label class="layui-form-label">工号</label>
                <div class="layui-input-block">
                    <input type="text" name="username" id="userID" disabled autocomplete="off" placeholder="请输入标题"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="userName" class="layui-form-label">用户名</label>
                <div class="layui-input-block">
                    <input type="text" name="username" id="userName" autocomplete="off" placeholder="请输入标题"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="password" class="layui-form-label">密码</label>
                <div class="layui-input-block">
                    <input type="password" name="password" id="password" placeholder="请输入密码" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="phone" class="layui-form-label">电话</label>
                <div class="layui-input-block">
                    <input type="text" name="username" id="phone" autocomplete="off" placeholder="请输入标题"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="state" class="layui-form-label">状态</label>
                <div class="layui-input-block">
                    <input type="text" name="username" id="state" autocomplete="off" placeholder="请输入标题"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button type="button" class="layui-btn layui-btn-normal" onclick="edit()">修改</button>
                    <button type="button" class="layui-btn" onclick="savePerson()">保存</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script>
    //提示操作员当前登录的是哪一个操作员，给页面赋值
    $(function () {
        let user = JSON.parse(localStorage.getItem("user"));
        layer.msg("你好！" + user.name, {icon: 1, time: 3000});
        $("#userID").val(user.id);
        $("#userName").val(user.name);
        $("#password").val(user.password);
        $("#phone").val(user.phone);
        $("#state").val(user.state);
        $("#person").find('input,textarea').attr('readonly', true);
    });

    //编辑当前操作员信息
    function edit() {
        $("#person").find('input,textarea').attr('readonly', false);
    }

    //保存当前操作员信息
    function savePerson() {
        $.ajax({
            url: "user/updateById",
            dataType: "json",
            data: {
                id: $("#userID").val(),
                name: $("#userName").val(),
                password: $("#password").val(),
                phone: $("#phone").val(),
                state: $("#state").val()
            },
            success: function (data) {
                if (data.code === 200) {
                    layer.msg("个人信息" + data.message, {icon: 1, time: 3000}, function () {
                        location.reload();
                    });
                } else {
                    layer.msg("个人信息" + data.message + "请重试", {icon: 2, time: 3000});
                }
            },
            error: function (err) {
                layer.msg('服务器走丢啦！', {icon: 7, time: 3000});
            }
        });
    }
</script>
</body>
</html>
