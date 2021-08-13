<%--
  Created by IntelliJ IDEA.
  User: liuxing
  Date: 2021/8/13
  Time: 15:17
  File：welcome.jsp
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
    <title>欢迎页面｜酒店后台管理系统</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="stylesheet" href="css/font.css">
    <link rel="stylesheet" href="css/xadmin.css">
    <script src="lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="js/xadmin.js"></script>
    <script type="text/javascript" src="js/jquery-3.6.0.js"></script>
</head>
<body>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body ">
                    <blockquote class="layui-elem-quote">欢迎回来：
                        <span class="x-red" id="user"></span>！当前时间:<span id="nowDate"></span>
                    </blockquote>
                </div>
            </div>
        </div>
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header">数据统计</div>
                <div class="layui-card-body ">
                    <ul class="layui-row layui-col-space10 layui-this x-admin-carousel x-admin-backlog">
                        <li class="layui-col-md2 layui-col-xs6">
                            <a href="javascript:;" class="x-admin-backlog-body">
                                <h3>房间总数</h3>
                                <p>
                                    <cite>100</cite></p>
                            </a>
                        </li>
                        <li class="layui-col-md2 layui-col-xs6">
                            <a href="javascript:;" class="x-admin-backlog-body">
                                <h3>空闲房间</h3>
                                <p>
                                    <cite>30</cite></p>
                            </a>
                        </li>
                        <li class="layui-col-md2 layui-col-xs6">
                            <a href="javascript:;" class="x-admin-backlog-body">
                                <h3>已预订</h3>
                                <p>
                                    <cite>26</cite></p>
                            </a>
                        </li>
                        <li class="layui-col-md2 layui-col-xs6">
                            <a href="javascript:;" class="x-admin-backlog-body">
                                <h3>已入住</h3>
                                <p>
                                    <cite>24</cite></p>
                            </a>
                        </li>
                        <li class="layui-col-md2 layui-col-xs6">
                            <a href="javascript:;" class="x-admin-backlog-body">
                                <h3>待打扫</h3>
                                <p>
                                    <cite>14</cite></p>
                            </a>
                        </li>
                        <li class="layui-col-md2 layui-col-xs6">
                            <a href="javascript:;" class="x-admin-backlog-body">
                                <h3>待维修</h3>
                                <p>
                                    <cite style="color: red;">6</cite></p>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header">系统信息</div>
                <div class="layui-card-body ">
                    <table class="layui-table">
                        <tbody>
                        <tr>
                            <th>当前版本</th>
                            <td>1.0.46</td>
                        </tr>
                        <tr>
                            <th>服务器地址</th>
                            <td>127.0.0.1</td>
                        </tr>
                        <tr>
                            <th>Tomcat</th>
                            <td>8.5.66</td>
                        </tr>
                        <tr>
                            <th>JAVA</th>
                            <td>1.8.0_291</td>
                        </tr>
                        <tr>
                            <th>Maven</th>
                            <td>3.8.1</td>
                        </tr>
                        <tr>
                            <th>MYSQL</th>
                            <td>8.0.25</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header">开发团队</div>
                <div class="layui-card-body ">
                    <table class="layui-table">
                        <tbody>
                        <tr>
                            <th>版权所有</th>
                            <td>第七组</td>
                        </tr>
                        <tr>
                            <th>开发人员</th>
                            <td>刘兴(liuxing997@foxmail.com)、
                                封锦(1435304038@qq.com)、
                                聂冉东(1059938559@qq.com)、
                                韩金洪(2443854179@qq.com)、
                                张泽源(2439612311@qq.com)
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <style id="welcome_style"></style>
    </div>
</div>
</div>
<script type="text/javascript" src="js/getTime.js"></script>
<script>
    $('document').ready(function () {
        getTime();
        $("#user").html(localStorage.getItem("user"));
    })

</script>
</body>
</html>
