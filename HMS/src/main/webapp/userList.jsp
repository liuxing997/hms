<%--
  Created by IntelliJ IDEA.
  User: liuxing
  Date: 2021/8/13
  Time: 17:49
  File：userlist.jsp
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
    <title>操作员列表｜酒店后台管理系统</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <jsp:include page="common.jsp"/>
</head>

<body>
<div class="x-nav">
            <span class="layui-breadcrumb">
                <a href="">首页</a>
                <a href="">操作员管理</a>
                <a>
                    <cite>操作员列表</cite></a>
            </span>
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
                    <form class="layui-form layui-col-space5">
                        <div class="layui-inline layui-show-xs-block">
                            <input type="text" id="username" placeholder="请输入用户名" autocomplete="off"
                                   class="layui-input"></div>
                        <div class="layui-inline layui-show-xs-block">
                            <button class="layui-btn" lay-submit="" lay-filter="sreach" onclick="getUserByName()">
                                <i class="layui-icon">&#xe615;</i></button>
                        </div>
                    </form>
                </div>
                <div class="layui-card-body ">
                    <table class="layui-table" id="userList">
                        <tr>
                            <th lay-data="{width:80, sort: true}">ID</th>
                            <th lay-data="{width:120, sort: true}">用户名</th>
                            <th lay-data="{minWidth: 150}">密码</th>
                            <th lay-data="{width:80,templet: '#switchTpl'}">电话</th>
                            <th lay-data="{minWidth: 100}">状态</th>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    $(function() {
        $.ajax({
            url:"user/getAllUser",
            type:"get",
            dataType:"json",
            beforeSend: function () {
                //显示登录加载提示
                this.index = layer.load(0, {shade: false, time: 10 * 1000})
            },
            complete: function () {
                layer.close(this.index);
            },
            success:function (data) {
                if (data.code === 200 && data.user != null ) {
                    // 获取成功
                    layer.msg(data.message, {icon: 1, time: 3000});
                    let users = data.user;
                    for (const n of users) {
                        let list = "<tr>" +
                            "<td>" + n.id + "</td>" +
                            "<td>" + n.name + "</td>" +
                            "<td>" + n.password + "</td>" +
                            "<td>" + n.phone + "</td>" +
                            "<td>" + n.state + "</td>" +
                            "</tr>";
                        $('#userList').append(list);
                    }
                }
            },
            error:function (err) {
                layer.msg('服务器被吃啦！请稍后重试', {icon: 7, time: 3000});
            }
        });
    });
    function getUserByName() {
        let username = $("#username").val();
        $.ajax({
            url:"user/queryByUsername",
            type:"get",
            dataType:"json",
            data:{
                name:username
            },
            beforeSend: function () {
                //显示登录加载提示
                this.index = layer.load(0, {shade: false, time: 10 * 1000})
            },
            complete: function () {
                layer.close(this.index);
            },
            success:function (data) {
                if (data.code === 200 && data.user != null ) {
                    // 获取成功
                    layer.msg(data.message, {icon: 1, time: 3000});
                    let users2 = data.user;
                    for (const n of users2) {
                        let list = "<tr>" +
                            "<td>" + n.id + "</td>" +
                            "<td>" + n.name + "</td>" +
                            "<td>" + n.password + "</td>" +
                            "<td>" + n.phone + "</td>" +
                            "<td>" + n.state + "</td>" +
                            "</tr>";
                        $('#userList').append(list);
                    }
                }
            },
            error:function (err) {
                layer.msg('服务器被吃啦！请稍后重试', {icon: 7, time: 3000});
            }
        });
    }
</script>

<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="getCheckData"> 获取选中行数据</button>
        <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>
        <button class="layui-btn layui-btn-sm" lay-event="isAll"> 验证是否全选</button>
    </div>
</script>

<script>
    layui.use('laydate',
    function () {
        var laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
            elem: '#end' //指定元素
        });

    });</script>
<script>
    layui.use('table',
    function () {
        var table = layui.table;

        //监听单元格编辑
        table.on('edit(test)',
            function (obj) {
                var value = obj.value //得到修改后的值
                    ,
                    data = obj.data //得到所在行所有键值
                    ,
                    field = obj.field; //得到字段
                layer.msg('[ID: ' + data.id + '] ' + field + ' 字段更改为：' + value);
            });

        //头工具栏事件
        table.on('toolbar(test)',
            function (obj) {
                var checkStatus = table.checkStatus(obj.config.id);
                switch (obj.event) {
                    case 'getCheckData':
                        var data = checkStatus.data;
                        layer.alert(JSON.stringify(data));
                        break;
                    case 'getCheckLength':
                        var data = checkStatus.data;
                        layer.msg('选中了：' + data.length + ' 个');
                        break;
                    case 'isAll':
                        layer.msg(checkStatus.isAll ? '全选' : '未全选');
                        break;
                };
            });
    });</script>

</html>
