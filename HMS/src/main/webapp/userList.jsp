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
                    <script type="text/html" id="userToolBar">
                        <div class="layui-card-body ">
                            <form class="layui-form layui-col-space5" onsubmit="return false;">
                                <div class="layui-inline layui-show-xs-block">
                                    <input type="text" id="username" placeholder="请输入用户名" autocomplete="off"
                                           class="layui-input"></div>
                                <div class="layui-inline layui-show-xs-block">
                                    <button class="layui-btn" lay-submit="" lay-filter="sreach"
                                            lay-event="getUserByName">
                                        <i class="layui-icon">&#xe615;</i></button>
                                    <button class="layui-btn layui-btn-sm" lay-event="addUser">新增</button>
                                </div>
                            </form>
                        </div>

                    </script>
                    <table class="layui-hide" id="user_list" lay-filter="user_list"></table>
                    <script type="text/html" id="user_list_bar">
                        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
                        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
                    </script>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 添加操作员模态框 -->
<div class="site-text" style="margin: 5%; display: none" id="addModel">
    <form class="layui-form">
        <div class="layui-form-item">
            <label class="layui-form-label">工号</label>
            <div class="layui-input-block">
                <input type="text" id="addid" name="bid" lay-verify="title" autocomplete="off" placeholder="请输入工号"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-block">
                <input type="text" id="addname" name="bname" lay-verify="title" autocomplete="off" placeholder="请输入用户名"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-block">
                <input type="password" id="addpassword" name="price" lay-verify="title" autocomplete="off"
                       placeholder="请输入密码" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">电话</label>
            <div class="layui-input-block">
                <input type="text" id="addphone" name="price" lay-verify="title" autocomplete="off" placeholder="请输入电话"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">状态</label>
            <div class="layui-input-block">
                <input type="text" id="addstate" name="price" lay-verify="title" autocomplete="off" placeholder="请输入状态"
                       class="layui-input">
            </div>
        </div>
    </form>
</div>

<!-- 编辑操作员模态框 -->
<div class="site-text" style="margin: 5%; display: none" id="editModel">
    <form class="layui-form">
        <div class="layui-form-item">
            <label class="layui-form-label">工号</label>
            <div class="layui-input-block">
                <input type="text" id="uid" name="bid" lay-verify="title" autocomplete="off" readonly disabled
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-block">
                <input type="text" id="uname" name="bname" lay-verify="title" autocomplete="off" placeholder="请输入用户"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-block">
                <input type="password" id="upassword" name="price" lay-verify="title" autocomplete="off"
                       placeholder="请输入密码" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">电话</label>
            <div class="layui-input-block">
                <input type="text" id="uphone" name="price" lay-verify="title" autocomplete="off" placeholder="请输入电话"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">状态</label>
            <div class="layui-input-block">
                <input type="text" id="ustate" name="price" lay-verify="title" autocomplete="off" placeholder="请输入状态"
                       class="layui-input">
            </div>
        </div>
    </form>
</div>
</body>
<script>
    layui.use('table', function () {
        let table = layui.table;
        table.render({
            elem: '#user_list'
            , url: 'user/getAllUser'
            , toolbar: '#userToolBar' //开启头部工具栏，并为其绑定左侧模板
            , defaultToolbar: ['filter', 'exports', 'print']
            , cellMinWidth: 180
            , title: '操作员列表'
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: 'id', title: 'ID', fixed: 'left', unresize: true, sort: true}
                , {field: 'name', title: '用户名', sort: true}
                , {field: 'password', title: '密码',}
                , {field: 'phone', title: '联系电话', sort: true}
                , {field: 'state', title: '状态', sort: true}
                , {fixed: 'right', title: '操作', toolbar: '#user_list_bar'}
            ]]
            , page: true
        });

        //头工具栏事件
        table.on('toolbar(user_list)', function (obj) {
            switch (obj.event) {
                case 'getUserByName':
                    console.log($("#username").val())
                    table.reload('user_list', {
                        url: 'user/searchUser',
                        where: {names: $("#username").val()},
                        page: true
                    })
                    break;
                case 'addUser':
                    layer.open({
                        type: 1 //Page层类型
                        , skin: 'layui-layer-molv'
                        , area: ['600px', '400px']
                        , title: ['添加操作员', 'font-size:18px']
                        , btn: ['保存', '取消']
                        , shadeClose: true
                        , shade: 0 //遮罩透明度
                        , maxmin: true //允许全屏最小化
                        , content: $("#addModel")  //弹窗路径
                        , yes: function (index, layero) {
                            $.ajax({
                                url: "user/insertUser",
                                dataType: "json",
                                data: {
                                    id: $("#addid").val(),
                                    name: $("#addname").val(),
                                    password: $("#addpassword").val(),
                                    phone: $("#addphone").val(),
                                    state: $("#addstate").val()
                                },
                                success: function (data) {
                                    if (data.code === 200) {
                                        layer.msg("操作员信息" + data.message, {icon: 1, time: 3000}, function () {
                                            layer.close(index);
                                            location.reload();
                                        });
                                    } else {
                                        layer.msg("操作员信息" + data.message + "请重试", {icon: 2, time: 3000});
                                    }
                                },
                                error: function (err) {
                                    layer.msg('服务器走丢啦！', {icon: 7, time: 3000});
                                }
                            });
                        }
                    });
                    break;
            }
            ;
        });

        //监听行工具事件
        table.on('tool(user_list)', function (obj) {
            let data = obj.data;
            if (obj.event === 'del') {
                layer.confirm('真的要删除' + data.name + "么？", {title: "提示"}, function (index) {
                    $.ajax({
                        url: "user/deleteById",
                        type: "get",
                        dataType: 'json',
                        data: {
                            id: data.id
                        },
                        success: function (res) {
                            if (res.code === 200) {
                                layer.msg(res.message, {icon: 1, time: 3000}, function () {
                                    obj.del();
                                    layer.close(index);
                                });
                            } else {
                                layer.msg(res.message, {icon: 2, time: 3000}, function () {
                                    layer.close(index);
                                });
                            }
                        },
                        error: function (err) {
                            layer.msg('服务器被吃啦！请稍后重试', {icon: 7, time: 3000});
                        }
                    })

                });
            } else if (obj.event === 'edit') {
                layer.open({
                    type: 1 //Page层类型
                    , skin: 'layui-layer-molv'
                    , area: ['600px', '400px']
                    , title: ['编辑操作员', 'font-size:18px']
                    , btn: ['保存', '取消']
                    , shadeClose: true
                    , shade: 0 //遮罩透明度
                    , maxmin: true //允许全屏最小化
                    , content: $("#editModel")  //弹窗路径
                    , success: function (layero, index) {
                        $('#uid').val(data.id);
                        $('#uname').val(data.name);
                        $('#upassword').val(data.password);
                        $('#uphone').val(data.phone);
                        $('#ustate').val(data.state);
                    }, yes: function (index, layero) {
                        $.ajax({
                            url: "user/updateById",
                            dataType: "json",
                            data: {
                                id: $("#uid").val(),
                                name: $("#uname").val(),
                                password: $("#upassword").val(),
                                phone: $("#uphone").val(),
                                state: $("#ustate").val()
                            },
                            success: function (data) {
                                if (data.code === 200) {
                                    layer.msg("操作员信息" + data.message, {icon: 1, time: 3000}, function () {
                                        layer.close(index);
                                        location.reload();
                                    });
                                } else {
                                    layer.msg("操作员信息" + data.message + "请重试", {icon: 2, time: 3000});
                                }
                            },
                            error: function (err) {
                                layer.msg('服务器走丢啦！', {icon: 7, time: 3000});
                            }
                        });
                    }
                });
            }
        });
    });
</script>

<%--<script>--%>
<%--    $(function() {--%>
<%--        $.ajax({--%>
<%--            url:"user/getAllUser",--%>
<%--            type:"get",--%>
<%--            dataType:"json",--%>
<%--            beforeSend: function () {--%>
<%--                //显示登录加载提示--%>
<%--                this.index = layer.load(0, {shade: false, time: 10 * 1000})--%>
<%--            },--%>
<%--            complete: function () {--%>
<%--                layer.close(this.index);--%>
<%--            },--%>
<%--            success:function (data) {--%>
<%--                if (data.code === 200 && data.user != null ) {--%>
<%--                    // 获取成功--%>
<%--                    layer.msg(data.message, {icon: 1, time: 3000});--%>
<%--                    let users = data.user;--%>
<%--                    for (const n of users) {--%>
<%--                        let list = "<tr>" +--%>
<%--                            "<td>" + n.id + "</td>" +--%>
<%--                            "<td>" + n.name + "</td>" +--%>
<%--                            "<td>" + n.password + "</td>" +--%>
<%--                            "<td>" + n.phone + "</td>" +--%>
<%--                            "<td>" + n.state + "</td>" +--%>
<%--                            "</tr>";--%>
<%--                        $('#userList').append(list);--%>
<%--                    }--%>
<%--                }--%>
<%--            },--%>
<%--            error:function (err) {--%>
<%--                layer.msg('服务器被吃啦！请稍后重试', {icon: 7, time: 3000});--%>
<%--            }--%>
<%--        });--%>
<%--    });--%>
<%--    function getUserByName() {--%>
<%--        let username = $("#username").val();--%>
<%--        $.ajax({--%>
<%--            url:"user/queryByUsername",--%>
<%--            type:"get",--%>
<%--            dataType:"json",--%>
<%--            data:{--%>
<%--                name:username--%>
<%--            },--%>
<%--            beforeSend: function () {--%>
<%--                //显示登录加载提示--%>
<%--                this.index = layer.load(0, {shade: false, time: 10 * 1000})--%>
<%--            },--%>
<%--            complete: function () {--%>
<%--                layer.close(this.index);--%>
<%--            },--%>
<%--            success:function (data) {--%>
<%--                if (data.code === 200 && data.user != null ) {--%>
<%--                    // 获取成功--%>
<%--                    layer.msg(data.message, {icon: 1, time: 3000});--%>
<%--                    let users2 = data.user;--%>
<%--                    for (const n of users2) {--%>
<%--                        let list = "<tr>" +--%>
<%--                            "<td>" + n.id + "</td>" +--%>
<%--                            "<td>" + n.name + "</td>" +--%>
<%--                            "<td>" + n.password + "</td>" +--%>
<%--                            "<td>" + n.phone + "</td>" +--%>
<%--                            "<td>" + n.state + "</td>" +--%>
<%--                            "</tr>";--%>
<%--                        $('#userList').append(list);--%>
<%--                    }--%>
<%--                }--%>
<%--            },--%>
<%--            error:function (err) {--%>
<%--                layer.msg('服务器被吃啦！请稍后重试', {icon: 7, time: 3000});--%>
<%--            }--%>
<%--        });--%>
<%--    }--%>
<%--</script>--%>


</html>
