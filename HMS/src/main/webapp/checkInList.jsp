<%--
  Created by IntelliJ IDEA.
  User: liuxing
  Date: 2021/8/16
  Time: 10:03
  File：checkInList.jsp
  Email: liuxing997@foxmail.com
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>入住列表｜酒店后台管理系统</title>
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
                <a href="">入住管理</a>
                <a>
                    <cite>入住列表</cite></a>
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
                    <script type="text/html" id="checkInToolBar">
                        <div class="layui-card-body ">
                            <form class="layui-form layui-col-space5" onsubmit="return false;">
                                <div class="layui-inline layui-show-xs-block">
                                    <input type="text" id="checkInNames" placeholder="房间号、ID" autocomplete="off"
                                           class="layui-input"></div>
                                <div class="layui-inline layui-show-xs-block">
                                    <button class="layui-btn" lay-submit="" lay-filter="sreach"
                                            lay-event="searchCheckIn">
                                        <i class="layui-icon">&#xe615;</i></button>
                                </div>
                            </form>
                        </div>
                    </script>
                    <%--表格区域--%>
                    <table class="layui-hide" id="check_list" lay-filter="check_list"></table>
                    <%--操作按钮模块--%>
<%--                    <script type="text/html" id="check_list_bar">--%>
<%--                        <a class="layui-btn layui-btn-xs" lay-event="cleanHouse">打扫</a>--%>
<%--                    </script>--%>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    //表格事件
    layui.use('table', function () {
        let table = layui.table;
        table.render({
            elem: '#check_list'
            , url: 'enter/queryEnter'
            , toolbar: '#checkInToolBar' //开启头部工具栏，并为其绑定左侧模板
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
            , title: '入住列表'
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: 'enter_id', title: '入住ID', fixed: 'left', unresize: true, align: "center"}
                , {field: 'house_id', title: '房间ID', align: "center",  sort: true}
                , {field: 'customer_id', title: '顾客ID', align: "center", sort: true}
                , {field: 'customer_info', title: '入住人数', align: "center", sort: true}
                , {field: 'start_time1', title: '入住时间',width:150, align: "center", sort: true}
                , {field: 'end_time_estimate1', title: '预计退房时间',width:150, align: "center", sort: true}
                , {field: 'end_time_actual1', title: '实际退房时间', width:150,align: "center", sort: true}
                , {field: 'fee_total', title: '房费', align: "center", sort: true}
                , {field: 'fee_info', title: '缴费流水号', width:150,align: "center", sort: true}
                , {field: 'user_id', title: '操作员ID', align: "center", sort: true}
                , {field: 'state', title: '缴费状态', align: "center", sort: true}
                , {field: 'price', title: '缴费金额', align: "center", sort: true}
                // , {fixed: 'right', title: '操作', toolbar: '#check_list_bar'}
            ]]
            , page: true
            , limit: 10
            , limits: [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
        });

        //头工具栏事件
        table.on('toolbar(cleanHouse_list)', function (obj) {
            switch (obj.event) {
                case 'searchCleanHouse':
                    // console.log($("#username").val())
                    table.reload('cleanHouse_list', {
                        url: 'house/getOneCus',
                        where: {name: $("#cleanHouseNames").val()},
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
            }
        });

        //监听行工具事件
        table.on('tool(clean_list_bar)', function (obj) {
            let data = obj.data;
            //打扫房间
            if (obj.event === 'cleanHouse') {
                layer.confirm('真的打扫了' + data.name + "么？", {title: "提示"}, function (index) {
                    $.ajax({
                        url: "house/deleteOneCus",
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
            }
        });
    });
</script>
</body>
</html>
