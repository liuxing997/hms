<%--
  Created by IntelliJ IDEA.
  User: liuxing
  Date: 2021/8/15
  Time: 14:01
  File：customerList.jsp
  Email: liuxing997@foxmail.com
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>客户列表｜酒店后台管理系统</title>
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
                <a href="">客户管理</a>
                <a>
                    <cite>客户列表</cite></a>
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
                    <script type="text/html" id="customerToolBar">
                        <div class="layui-card-body ">
                            <form class="layui-form layui-col-space5" onsubmit="return false;">
                                <div class="layui-inline layui-show-xs-block">
                                    <input type="text" id="customerNames" placeholder="请输入姓名、身份证、电话" autocomplete="off"
                                           class="layui-input" style="width: 200px;"></div>
                                <div class="layui-inline layui-show-xs-block">
                                    <button class="layui-btn" lay-submit="" lay-filter="sreach"
                                            lay-event="getCustomerByName">
                                        <i class="layui-icon">&#xe615;</i></button>
                                    <button class="layui-btn layui-btn-sm" lay-event="addCustomer">新增</button>
                                </div>
                            </form>
                        </div>
                    </script>
                    <%--表格区域--%>
                    <table class="layui-hide" id="customer_list" lay-filter="customer_list"></table>
                    <%--操作按钮模块--%>
                    <script type="text/html" id="customer_list_bar">
                        <a class="layui-btn layui-btn-xs" lay-event="editCustomer">编辑</a>
                        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delCustomer">删除</a>
                    </script>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 添加客户模态框 -->
<div class="site-text" style="margin: 5%; display: none" id="addCustomerModel">
    <form class="layui-form">
        <div class="layui-form-item">
            <label for="addCustomerId" class="layui-form-label">ID</label>
            <div class="layui-input-block">
                <input type="text" id="addCustomerId" lay-verify="title" autocomplete="off" placeholder="请输入ID"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="addCustomerName" class="layui-form-label">姓名</label>
            <div class="layui-input-block">
                <input type="text" id="addCustomerName" lay-verify="title" autocomplete="off" placeholder="请输入姓名"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="addCustomerCard" class="layui-form-label">身份证号码</label>
            <div class="layui-input-block">
                <input type="text" id="addCustomerCard" lay-verify="title" autocomplete="off"
                       placeholder="请输入身份证号码" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="addCustomerPhone" class="layui-form-label">座机号码</label>
            <div class="layui-input-block">
                <input type="text" id="addCustomerPhone" lay-verify="title" autocomplete="off" placeholder="请输入座机号码"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="addCustomerMobile" class="layui-form-label">手机号码</label>
            <div class="layui-input-block">
                <input type="text" id="addCustomerMobile" lay-verify="title" autocomplete="off" placeholder="请输入手机号码"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="addCustomerRemainder" class="layui-form-label">余额</label>
            <div class="layui-input-block">
                <input type="text" id="addCustomerRemainder" lay-verify="title" autocomplete="off" placeholder="请输入余额"
                       class="layui-input">
            </div>
        </div>
    </form>
</div>

<!-- 编辑客户模态框 -->
<div class="site-text" style="margin: 5%; display: none" id="editCustomerModel">
    <form class="layui-form">
        <div class="layui-form-item">
            <label for="editCustomerId" class="layui-form-label">ID</label>
            <div class="layui-input-block">
                <input type="text" id="editCustomerId" lay-verify="title" autocomplete="off" readonly disabled
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="editCustomerName" class="layui-form-label">姓名</label>
            <div class="layui-input-block">
                <input type="text" id="editCustomerName" lay-verify="title" autocomplete="off" placeholder="请输入姓名"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="editCustomerCard" class="layui-form-label">身份证号码</label>
            <div class="layui-input-block">
                <input type="text" id="editCustomerCard" lay-verify="title" autocomplete="off"
                       placeholder="请输入身份证号码" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="editCustomerPhone" class="layui-form-label">座机号码</label>
            <div class="layui-input-block">
                <input type="text" id="editCustomerPhone" lay-verify="title" autocomplete="off" placeholder="请输入座机号码"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="editCustomerMobile" class="layui-form-label">手机号码</label>
            <div class="layui-input-block">
                <input type="text" id="editCustomerMobile" lay-verify="title" autocomplete="off" placeholder="请输入手机号码"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="editCustomerRemainder" class="layui-form-label">余额</label>
            <div class="layui-input-block">
                <input type="text" id="editCustomerRemainder" lay-verify="title" autocomplete="off" placeholder="请输入余额"
                       class="layui-input">
            </div>
        </div>
    </form>
</div>

<script>
    //表格事件
    layui.use('table', function () {
        let table = layui.table;
        table.render({
            elem: '#customer_list'
            , url: 'customer/getAllCus'
            , toolbar: '#customerToolBar' //开启头部工具栏，并为其绑定左侧模板
            , defaultToolbar: ['filter', 'exports', 'print']
            , cellMinWidth: 80
            , parseData: function (res) {
                return {
                    "code": res.code,
                    "msg": res.msg,
                    "count": res.data.totalSize,
                    "data": res.data.list
                }
            }
            , title: '客户列表'
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: 'customer_id', title: 'ID', fixed: 'left', unresize: true, align: "center"}
                , {field: 'name', title: '姓名', align: "center", sort: true}
                , {field: 'card', title: '身份证号码', align: "center", sort: true}
                , {field: 'phone', title: '座机', align: "center", sort: true}
                , {field: 'mobile', title: '手机', align: "center", sort: true}
                , {field: 'remainder', title: '余额', align: "center", sort: true}
                , {fixed: 'right', title: '操作', toolbar: '#customer_list_bar'}
            ]]
            , page: true
            , limit: 10
            , limits: [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
        });

        //头工具栏事件
        table.on('toolbar(customer_list)', function (obj) {
            switch (obj.event) {
                case 'getCustomerByName': //搜索客户
                    // console.log($("#username").val())
                    table.reload('customer_list', {
                        url: 'customer/getOneCus',
                        where: {name: $("#customerNames").val()},
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
                case 'addCustomer': //添加客户
                    layer.open({
                        type: 1 //Page层类型
                        , skin: 'layui-layer-molv'
                        , area: '600px'
                        , title: ['添加客户', 'font-size:18px']
                        , btn: ['保存', '取消']
                        , shadeClose: true
                        , shade: 0 //遮罩透明度
                        , maxmin: true //允许全屏最小化
                        , content: $("#addCustomerModel")  //弹窗路径
                        , yes: function (index, layero) {
                            layer.iframeAuto(index)//高度自适应
                            let addCustomerId = $('#addCustomerId').val();
                            let addCustomerName = $('#addCustomerName').val();
                            let addCustomerCard = $('#addCustomerCard').val();
                            let addCustomerPhone = $('#addCustomerPhone').val();
                            let addCustomerMobile = $('#addCustomerMobile').val();
                            let addCustomerRemainder = $('#addCustomerRemainder').val();
                            if (addCustomerId.length === 0 && addCustomerName.length === 0 && addCustomerCard.length === 0 && addCustomerPhone.length === 0 && addCustomerMobile.length === 0 && addCustomerRemainder.length === 0) {
                                layer.msg("请先填写完整信息！", {icon: 2, time: 3000});
                            }
                            if (addCustomerId.length === 0) {
                                layer.msg("客户ID不能为空！", {icon: 2, time: 3000});
                            } else if (addCustomerName.length === 0) {
                                layer.msg("客户姓名不能为空！", {icon: 2, time: 3000});
                            } else if (addCustomerCard.length === 0) {
                                layer.msg("身份证号码不能为空！", {icon: 2, time: 3000});
                            } else if (addCustomerPhone.length === 0) {
                                layer.msg("座机号码不能为空！", {icon: 2, time: 3000});
                            } else if (addCustomerMobile.length === 0) {
                                layer.msg("手机号码不能为空！", {icon: 2, time: 3000});
                            } else if (addCustomerRemainder.length === 0) {
                                layer.msg("余额不能为空！", {icon: 2, time: 3000});
                            } else if (addCustomerId.length !== 0 && addCustomerName.length !== 0 && addCustomerCard.length !== 0 && addCustomerPhone.length !== 0 && addCustomerMobile.length !== 0 && addCustomerRemainder.length !== 0) {
                                $.ajax({
                                    url: "customer/insertOneCus",
                                    dataType: "json",
                                    data: {
                                        customer_id: addCustomerId,
                                        name: addCustomerName,
                                        card: addCustomerCard,
                                        phone: addCustomerPhone,
                                        mobile: addCustomerMobile,
                                        remainder: addCustomerRemainder
                                    },
                                    success: function (data) {
                                        if (data.code === 200) {
                                            layer.msg("客户信息" + data.message, {icon: 1, time: 3000}, function () {
                                                layer.close(index);
                                                location.reload();
                                            });
                                        } else {
                                            layer.msg("客户信息" + data.message + "请重试", {icon: 2, time: 3000});
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
        });

        //监听行工具事件
        table.on('tool(customer_list)', function (obj) {
            let data = obj.data;
            if (obj.event === 'delCustomer') { //删除客户
                layer.confirm('真的要删除' + data.name + "么？", {title: "提示"}, function (index) {
                    $.ajax({
                        url: "customer/deleteOneCus",
                        type: "get",
                        dataType: 'json',
                        data: {
                            customer_id: data.customer_id
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
            } else if (obj.event === 'editCustomer') { //修改客户信息
                layer.open({
                    type: 1 //Page层类型
                    , skin: 'layui-layer-molv'
                    , area: '600px'
                    , title: ['修改客户信息', 'font-size:18px']
                    , btn: ['保存', '取消']
                    , shadeClose: true
                    , shade: 0 //遮罩透明度
                    , maxmin: true //允许全屏最小化
                    , content: $("#editCustomerModel")  //弹窗路径
                    , success: function (layero, index) {
                        layer.iframeAuto(index)//高度自适应
                        $('#editCustomerId').val(data.customer_id);
                        $('#editCustomerName').val(data.name);
                        $('#editCustomerCard').val(data.card);
                        $('#editCustomerPhone').val(data.phone);
                        $('#editCustomerMobile').val(data.mobile);
                        $('#editCustomerRemainder').val(data.remainder);
                    }, yes: function (index, layero) {
                        let editCustomerId = $('#editCustomerId').val();
                        let editCustomerName = $('#editCustomerName').val();
                        let editCustomerCard = $('#editCustomerCard').val();
                        let editCustomerPhone = $('#editCustomerPhone').val();
                        let editCustomerMobile = $('#editCustomerMobile').val();
                        let editCustomerRemainder = $('#editCustomerRemainder').val();
                        if (editCustomerId.length === 0 && editCustomerName.length === 0 && editCustomerCard.length === 0 && editCustomerPhone.length === 0 && editCustomerMobile.length === 0 && editCustomerRemainder.length === 0) {
                            layer.msg("请先填写完整信息！", {icon: 2, time: 3000});
                        }
                        if (editCustomerId.length === 0) {
                            layer.msg("客户ID不能为空！", {icon: 2, time: 3000});
                        } else if (editCustomerName.length === 0) {
                            layer.msg("客户姓名不能为空！", {icon: 2, time: 3000});
                        } else if (editCustomerCard.length === 0) {
                            layer.msg("身份证号码不能为空！", {icon: 2, time: 3000});
                        } else if (editCustomerPhone.length === 0) {
                            layer.msg("座机号码不能为空！", {icon: 2, time: 3000});
                        } else if (editCustomerMobile.length === 0) {
                            layer.msg("手机号码不能为空！", {icon: 2, time: 3000});
                        } else if (editCustomerRemainder.length === 0) {
                            layer.msg("余额不能为空！", {icon: 2, time: 3000});
                        } else if (editCustomerId.length !== 0 && editCustomerName.length !== 0 && editCustomerCard.length !== 0 && editCustomerPhone.length !== 0 && editCustomerMobile.length !== 0 && editCustomerRemainder.length !== 0) {
                            $.ajax({
                                url: "customer/updateOneCus",
                                dataType: "json",
                                data: {
                                    customer_id: editCustomerId,
                                    name: editCustomerName,
                                    card: editCustomerCard,
                                    phone: editCustomerPhone,
                                    mobile: editCustomerMobile,
                                    remainder: editCustomerRemainder
                                },
                                success: function (data) {
                                    if (data.code === 200) {
                                        layer.msg("客户信息" + data.message, {icon: 1, time: 3000}, function () {
                                            layer.close(index);
                                            location.reload();
                                        });
                                    } else {
                                        layer.msg("客户信息" + data.message + "请重试", {icon: 2, time: 3000});
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
</body>
</html>
