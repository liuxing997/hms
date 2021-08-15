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
    <jsp:include page="common.jsp"/>
</head>
<body>
<div class="x-nav">
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"
       onclick="location.reload()" title="刷新">
        <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i>
    </a>
</div>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body ">
                    <blockquote class="layui-elem-quote">欢迎回来：
                        <span class="x-red" id="loginUser"></span>！当前时间:<span id="nowDate"></span>
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
                                    <cite id="houseSum">100</cite></p>
                            </a>
                        </li>
                        <li class="layui-col-md2 layui-col-xs6">
                            <a href="javascript:;" class="x-admin-backlog-body">
                                <h3>空闲房间</h3>
                                <p>
                                    <cite id="houseNull">30</cite></p>
                            </a>
                        </li>
                        <li class="layui-col-md2 layui-col-xs6">
                            <a href="javascript:;" class="x-admin-backlog-body">
                                <h3>已预订</h3>
                                <p>
                                    <cite id="houseReserve">26</cite></p>
                            </a>
                        </li>
                        <li class="layui-col-md2 layui-col-xs6">
                            <a href="javascript:;" class="x-admin-backlog-body">
                                <h3>已入住</h3>
                                <p>
                                    <cite id="houseCheckIn">24</cite></p>
                            </a>
                        </li>
                        <li class="layui-col-md2 layui-col-xs6">
                            <a href="javascript:;" class="x-admin-backlog-body">
                                <h3>待打扫</h3>
                                <p>
                                    <cite id="houseClean">14</cite></p>
                            </a>
                        </li>
                        <li class="layui-col-md2 layui-col-xs6">
                            <a href="javascript:;" class="x-admin-backlog-body">
                                <h3>待维修</h3>
                                <p>
                                    <cite id="houseMaintain" style="color: red;">6</cite></p>
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

<script>
    $('document').ready(function () {
        getTime();
        $("#loginUser").html(JSON.parse(localStorage.getItem("user")).name);

        //获取房间统计信息
        $.ajax({
            url:"house/totalOfHouse",
            type:"get",
            dataType:"json",
            beforeSend: function () {
                this.index = layer.load(0, {shade: false, time: 10 * 1000})
            },
            complete: function () {
                layer.close(this.index);
            },
            success:function (data) {
                if (data.code === 200) {
                    $("#houseSum").html(data.data.Sum);
                    $("#houseNull").html(data.data.Null);
                    $("#houseReserve").html(data.data.Reserve);
                    $("#houseCheckIn").html(data.data.CheckIn);
                    $("#houseClean").html(data.data.Clean);
                    $("#houseMaintain").html(data.data.Maintain);
                }
            },
            error:function (err) {
                layer.msg('服务器被吃啦！请稍后重试', {icon: 7, time: 3000});
            }
        })
    })

</script>
</body>
</html>
