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
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>操作员列表｜酒店后台管理系统</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <%--  引入公共样式和脚本文件  --%>
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
                <%--搜索和新增模块--%>
                <div class="layui-card-body ">
                    <script type="text/html" id="userToolBar">
                        <div class="layui-card-body ">
                            <form class="layui-form layui-col-space5" onsubmit="return false;">
                                <div class="layui-inline layui-show-xs-block">
                                    <input type="text" id="searchUserNames" placeholder="请输入用户名或工号" autocomplete="off"
                                           class="layui-input"></div>
                                <div class="layui-inline layui-show-xs-block">
                                    <button class="layui-btn" lay-submit="" lay-filter="sreach"
                                            lay-event="searchUserByName">
                                        <i class="layui-icon">&#xe615;</i></button>
                                    <button class="layui-btn layui-btn-sm" lay-event="addOneUser">新增</button>
                                </div>
                            </form>
                        </div>
                    </script>
                    <%--表格区域--%>
                    <table class="layui-hide" id="user_list" lay-filter="user_list"></table>
                    <%--操作按钮模块--%>
                    <script type="text/html" id="user_list_bar">
                        <a class="layui-btn layui-btn-xs" lay-event="editOneUser">编辑</a>
                        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delOneUser">删除</a>
                    </script>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 添加操作员模态框 -->
<div class="site-text" style="margin: 5%; display: none" id="addUserModel">
    <form class="layui-form">
        <div class="layui-form-item">
            <label for="addUserId" class="layui-form-label">工号</label>
            <div class="layui-input-block">
                <input type="text" id="addUserId" lay-verify="title" autocomplete="off" placeholder="请输入工号"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="addUserName" class="layui-form-label">用户名</label>
            <div class="layui-input-block">
                <input type="text" id="addUserName" lay-verify="title" autocomplete="off" placeholder="请输入用户名"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="addUserPassword" class="layui-form-label">密码</label>
            <div class="layui-input-block">
                <input type="password" id="addUserPassword" name="price" lay-verify="title" autocomplete="off"
                       placeholder="请输入密码" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="addUserPhone" class="layui-form-label">电话</label>
            <div class="layui-input-block">
                <input type="text" id="addUserPhone" lay-verify="title" autocomplete="off" placeholder="请输入电话"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="addUserState" class="layui-form-label">状态</label>
            <div class="layui-input-block">
                <select id="addUserState" lay-filter="addUserState">
                    <option value="活动" selected>活动</option>
                    <option value="禁用">禁用</option>
                    <option value="其他">其他</option>
                </select>
            </div>
        </div>
    </form>
</div>

<!-- 编辑操作员模态框 -->
<div class="site-text" style="margin: 5%; display: none" id="editUserModel">
    <form class="layui-form">
        <div class="layui-form-item">
            <label for="editUserId" class="layui-form-label">工号</label>
            <div class="layui-input-block">
                <input type="text" id="editUserId" lay-verify="title" autocomplete="off" readonly disabled
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="editUserName" class="layui-form-label">用户名</label>
            <div class="layui-input-block">
                <input type="text" id="editUserName" lay-verify="title" autocomplete="off" placeholder="请输入用户"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="editUserPassword" class="layui-form-label">密码</label>
            <div class="layui-input-block">
                <input type="password" id="editUserPassword" lay-verify="title" autocomplete="off"
                       placeholder="请输入密码" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                注意：这里是暗文密码，修改时请先清空!
            </div>
        </div>
        <div class="layui-form-item">
            <label for="editUserPhone" class="layui-form-label">电话</label>
            <div class="layui-input-block">
                <input type="text" id="editUserPhone" lay-verify="title" autocomplete="off" placeholder="请输入电话"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="editUserState" class="layui-form-label">状态</label>
            <div class="layui-input-block">
                <select id="editUserState" lay-filter="editUserState">
                    <option value="活动">活动</option>
                    <option value="禁用">禁用</option>
                    <option value="其他">其他</option>
                </select>
            </div>
        </div>
    </form>
</div>
</body>
<script>
    //表格事件
    layui.use('table', function () {
        let table = layui.table;
        table.render({
            elem: '#user_list'
            , url: 'user/getAllUser'
            , toolbar: '#userToolBar' //开启头部工具栏，并为其绑定左侧模板
            , defaultToolbar: ['filter', 'exports', 'print']
            , cellMinWidth: 100
            , parseData: function (res) {
                return {
                    "code": res.code,
                    "msg": res.msg,
                    "count": res.data.totalSize,
                    "data": res.data.list
                }
            }
            , title: '操作员列表'
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: 'id', title: 'ID', fixed: 'left', unresize: true, align: "center", sort: true}
                , {field: 'name', title: '用户名', align: "center", sort: true}
                , {
                    field: 'password', title: '密码', align: "left", templet: function (data) {
                        return `<input id="newPassword" type="password"
                                value="` + data.password + `"
                                class="layui-input"
                                style="border:none;"
                                readonly>`
                    }
                }
                , {field: 'phone', title: '联系电话', align: "center", sort: true}
                , {field: 'state', title: '状态', align: "center", sort: true}
                , {fixed: 'right', title: '操作', align: "center", toolbar: '#user_list_bar'}
            ]]
            , page: true
            , limit: 10
            , limits: [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
        });

        //头工具栏
        table.on('toolbar(user_list)', function (obj) {
            switch (obj.event) {
                case 'searchUserByName': //搜索操作员
                    table.reload('user_list', {
                        url: 'user/searchUser',
                        where: {names: $("#searchUserNames").val()},
                        parseData: function (res) {
                            if (res.code === 0) {
                                return {
                                    "code": res.code,
                                    "msg": res.msg,
                                    "count": res.data.length,
                                    "data": res.data
                                }
                            } else {
                                return {
                                    "code": res.code,
                                    "msg": res.msg,
                                    "count": 0,
                                }
                            }
                        }, page: true
                    })
                    break;
                case 'addOneUser': //添加操作员
                    layer.open({
                        type: 1 //Page层类型
                        , skin: 'layui-layer-molv'
                        , area: '600px'
                        , title: ['添加操作员', 'font-size:18px']
                        , btn: ['保存', '取消']
                        , shadeClose: true
                        , shade: 0 //遮罩透明度
                        , maxmin: true //允许全屏最小化
                        , content: $("#addUserModel")  //弹窗路径
                        , yes: function (index, layero) {
                            layer.iframeAuto(index)//高度自适应
                            let addUserId = $("#addUserId").val();
                            let addUserName = $("#addUserName").val();
                            let addUserPassword = $("#addUserPassword").val();
                            let addUserPhone = $("#addUserPhone").val();
                            let addUserState = $("#addUserState").val();
                            if (addUserId.length === 0 && addUserName.length === 0 && addUserPassword.length === 0 && addUserPhone.length === 0 && addUserState.length === 0) {
                                layer.msg("请先填写完整信息！", {icon: 2, time: 3000});
                            } else if (addUserId.length === 0) {
                                layer.msg("操作员ID不能为空！", {icon: 2, time: 3000});
                            } else if (addUserName.length === 0) {
                                layer.msg("姓名不能为空！", {icon: 2, time: 3000});
                            } else if (addUserPassword.length === 0) {
                                layer.msg("密码不能为空！", {icon: 2, time: 3000});
                            } else if (addUserPhone.length === 0) {
                                layer.msg("电话不能为空！", {icon: 2, time: 3000});
                            } else if (addUserState.length === 0) {
                                layer.msg("状态不能为空！", {icon: 2, time: 3000});
                            } else if (addUserId.length !== 0 && addUserName.length !== 0 && addUserPassword.length !== 0 && addUserPhone.length !== 0 && addUserState.length !== 0) {
                                $.ajax({
                                    url: "user/insertUser",
                                    dataType: "json",
                                    data: {
                                        id: addUserId,
                                        name: addUserName,
                                        password: addUserPassword,
                                        phone: addUserPhone,
                                        state: addUserState
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
                        }
                    });
                    break;
            }
            ;
        });

        //监听行工具
        table.on('tool(user_list)', function (obj) {
            let data = obj.data;
            if (obj.event === 'delOneUser') { //删除操作员
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
            } else if (obj.event === 'editOneUser') { //编辑操作员
                layer.open({
                    type: 1 //Page层类型
                    , skin: 'layui-layer-molv'
                    , area: '600px'
                    , title: ['编辑操作员', 'font-size:18px']
                    , btn: ['保存', '取消']
                    , shadeClose: true
                    , shade: 0 //遮罩透明度
                    , maxmin: true //允许全屏最小化
                    , content: $("#editUserModel")  //弹窗路径
                    , success: function (layero, index) {
                        layer.iframeAuto(index)//高度自适应
                        $('#editUserId').val(data.id);
                        $('#editUserName').val(data.name);
                        $('#editUserPassword').val(data.password);
                        $('#editUserPhone').val(data.phone);
                        $('#editUserState').val(data.state);
                    }, yes: function (index, layero) {
                        let editUserId = $("#editUserId").val();
                        let editUserName = $("#editUserName").val();
                        let editUserPassword = $("#editUserPassword").val();
                        let editUserPhone = $("#editUserPhone").val();
                        let editUserState = $("#editUserState").val();
                        if (editUserId.length === 0 && editUserName.length === 0 && editUserPassword.length === 0 && editUserPhone.length === 0 && editUserState.length === 0) {
                            layer.msg("请先填写完整信息！", {icon: 2, time: 3000});
                        }
                        if (editUserId.length === 0) {
                            layer.msg("操作员ID不能为空！", {icon: 2, time: 3000});
                        } else if (editUserName.length === 0) {
                            layer.msg("操作员姓名不能为空！", {icon: 2, time: 3000});
                        } else if (editUserPassword.length === 0) {
                            layer.msg("密码不能为空！", {icon: 2, time: 3000});
                        } else if (editUserPhone.length === 0) {
                            layer.msg("手机号码不能为空！", {icon: 2, time: 3000});
                        } else if (editUserState.length === 0) {
                            layer.msg("状态不能为空！", {icon: 2, time: 3000});
                        } else if (editUserId.length !== 0 && editUserName.length !== 0 && editUserPassword.length !== 0 && editUserPhone.length !== 0 && editUserState.length !== 0) {
                            $.ajax({
                                url: "user/updateById",
                                dataType: "json",
                                data: {
                                    id: editUserId,
                                    name: editUserName,
                                    password: editUserPassword,
                                    phone: editUserPhone,
                                    state: editUserState
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
                    }
                });
            }
        });
    });
</script>
</html>
