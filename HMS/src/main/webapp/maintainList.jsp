<%--
  Created by IntelliJ IDEA.
  User: liuxing
  Date: 2021/8/16
  Time: 09:24
  File：maintainList.jsp
  Email: liuxing997@foxmail.com
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>待维修列表｜酒店后台管理系统</title>
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
                <a href="">待办管理</a>
                <a>
                    <cite>待维修列表</cite></a>
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
                    <script type="text/html" id="maintainHouseToolBar">
                        <div class="layui-card-body ">
                            <form class="layui-form layui-col-space5" onsubmit="return false;">
                                <div class="layui-inline layui-show-xs-block">
                                    <input type="text" id="maintainHouseNames" placeholder="请输入房间号、ID" autocomplete="off"
                                           class="layui-input"></div>
                                <div class="layui-inline layui-show-xs-block">
                                    <button class="layui-btn" lay-submit="" lay-filter="sreach"
                                            lay-event="searchMaintainHouse">
                                        <i class="layui-icon">&#xe615;</i></button>
                                </div>
                            </form>
                        </div>
                    </script>
                    <%--表格区域--%>
                    <table class="layui-hide" id="maintainHouse_list" lay-filter="maintainHouse_list"></table>
                    <%--操作按钮模块--%>
                    <script type="text/html" id="maintain_list_bar">
                        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="maintainHouse">维修</a>
                    </script>
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
            elem: '#maintainHouse_list'
            , url: 'house/queryBySateMaintain'
            , toolbar: '#maintainHouseToolBar' //开启头部工具栏，并为其绑定左侧模板
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
            , title: '待维修列表'
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: 'houseId', title: '房间ID', fixed: 'left', unresize: true, align: "center"}
                , {field: 'houseName', title: '房间号', align: "center",  sort: true}
                , {field: 'amount', title: '可入住数量', align: "center", sort: true}
                , {field: 'price', title: '价格', align: "center", sort: true}
                , {field: 'floorId', title: '楼层', align: "center", sort: true}
                , {field: 'state', title: '状态', align: "center", sort: true}
                , {fixed: 'right', title: '操作', toolbar: '#maintain_list_bar'}
            ]]
            , page: true
            , limit: 10
            , limits: [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
        });

        //头工具栏事件
        table.on('toolbar(maintainHouse_list)', function (obj) {
            switch (obj.event) {
                case 'searchMaintainHouse':
                    table.reload('maintainHouse_list', {
                        url: 'house/searchHouseMaintain',
                        where: {names: $("#maintainHouseNames").val()},
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
        table.on('tool(maintainHouse_list)', function (obj) {
            let data = obj.data;
            console.log(data)
            //打扫房间
            if (obj.event === 'maintainHouse') {
                layer.confirm('真的维修了' + data.houseName + "房间么？", {title: "提示",btn:["已维修","未维修"]}, function (index) {
                    $.ajax({
                        url: "house/updateMaintainState",
                        type: "get",
                        dataType: 'json',
                        data: {
                            name: data.houseName
                        },
                        success: function (res) {
                            if (res.code === 200) {
                                layer.msg(res.message, {icon: 1, time: 3000}, function () {
                                    obj.del();
                                    layer.close(index);
                                    location.reload();
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