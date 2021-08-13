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
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>首页｜酒店后台管理系统</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="stylesheet" href="css/font.css">
    <link rel="stylesheet" href="css/xadmin.css">
    <!-- <link rel="stylesheet" href="./css/theme5.css"> -->
    <script type="text/javascript" src="js/jquery-3.6.0.js"></script>
    <script src="lib/layui/layui.js" charset="utf-8"></script>
    <script src="lib/layer/layer.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="js/xadmin.js"></script>
    <script>
        // 是否开启刷新记忆tab功能
        // var is_remember = false;
    </script>
</head>
<body class="index">
<div class="container">
    <div class="logo">
        <a href="./index.jsp">酒店后台管理系统</a></div>
    <div class="left_open">
        <a><i title="展开左侧栏" class="iconfont">&#xe699;</i></a>
    </div>
    <ul class="layui-nav right" lay-filter="">
        <li class="layui-nav-item">
            <a href="javascript:;"><span id="userName"></span></a>
            <dl class="layui-nav-child">
                <dd>
                    <a onclick="xadmin.open('个人信息','https://www.baidu.com')">个人信息</a></dd>
                <dd>
                    <a href="javascript:void(0);" onclick="logout()">退出</a></dd>
            </dl>
        </li>
    </ul>
</div>
<div class="left-nav">
    <div id="side-nav">
        <ul id="nav">
            <li>
                <a href="javascript:;">
                    <i class="iconfont left-nav-li" lay-tips="房间管理">&#xe6b4;</i>
                    <cite>房间管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
                <ul class="sub-menu">
                    <li>
                        <a onclick="xadmin.add_tab('房间列表','order-list.html')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>房间列表</cite></a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont left-nav-li" lay-tips="订房管理">&#xe71c;</i>
                    <cite>订房管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
                <ul class="sub-menu">
                    <li>
                        <a onclick="xadmin.add_tab('订房列表','cate.html')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>订房列表</cite></a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont left-nav-li" lay-tips="退房管理">&#xe723;</i>
                    <cite>退房管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
                <ul class="sub-menu">
                    <li>
                        <a onclick="xadmin.add_tab('退房列表','city.html')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>退房列表</cite></a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont left-nav-li" lay-tips="入住管理">&#xe726;</i>
                    <cite>入住管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
                <ul class="sub-menu">
                    <li>
                        <a onclick="xadmin.add_tab('管理员列表','admin-list.html')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>入住列表</cite></a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont left-nav-li" lay-tips="客户查询">&#xe6ac;</i>
                    <cite>客户查询</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont left-nav-li" lay-tips="维修管理">&#xe6ab;</i>
                    <cite>维修管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
                <ul class="sub-menu">
                    <li>
                        <a onclick="xadmin.add_tab('维修列表','unicode.html')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>维修列表</cite></a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont left-nav-li" lay-tips="操作员管理">&#xe6c7;</i>
                    <cite>操作员管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
                <ul class="sub-menu">
                    <li>
                        <a onclick="xadmin.add_tab('操作员列表','userList.jsp')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>操作员列表</cite></a>
                    </li>

                </ul>
            </li>
        </ul>
    </div>
</div>
<div class="page-content">
    <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
        <ul class="layui-tab-title">
            <li class="home">
                <i class="layui-icon">&#xe68e;</i>首页
            </li>
        </ul>
        <div class="layui-unselect layui-form-select layui-form-selected" id="tab_right">
            <dl>
                <dd data-type="this">关闭当前</dd>
                <dd data-type="other">关闭其它</dd>
                <dd data-type="all">关闭全部</dd>
            </dl>
        </div>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <iframe src='./welcome.jsp' frameborder="0" scrolling="yes" class="x-iframe"></iframe>
            </div>
        </div>
        <div id="tab_show"></div>
    </div>
</div>
<div class="page-content-bg"></div>
<style id="theme_style"></style>
<script>
    $(function () {
        $("#userName").html(localStorage.getItem("user"));
    })

    function logout() {
        $.ajax({
            url: "user/logout",
            dataType: "json",
            success: function (data) {
                if (data.code === 200) {
                    layer.msg("退出成功，欢迎再次使用！", {icon: 2, time: 3000}, function () {
                        localStorage.removeItem("user");
                        window.location.href = "login.jsp";
                    });
                }
            },
            error: function (err) {
                layer.msg('服务器被吃啦！', {icon: 7, time: 3000});
            }
        })
    }
</script>
</body>


</html>
