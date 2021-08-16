<%--
  Created by IntelliJ IDEA.
  User: liuxing
  Date: 2021/8/16
  Time: 10:03
  File：paidList.jsp
  Email: liuxing997@foxmail.com
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>已缴费列表｜酒店后台管理系统</title>
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
                <a href="">缴费管理</a>
                <a>
                    <cite>已缴费列表</cite></a>
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
                    <script type="text/html" id="paidToolBar">
                        <div class="layui-card-body ">
                            <form class="layui-form layui-col-space5" onsubmit="return false;">
                                <div class="layui-inline layui-show-xs-block">
                                    <input type="text" id="searchPaidFeeNames" placeholder="请输入缴费ID、入住ID、顾客ID、房间ID、操作员ID"
                                           autocomplete="off"
                                           class="layui-input" style="width: 300px;"></div>
                                <div class="layui-inline layui-show-xs-block">
                                    <button class="layui-btn" lay-submit="" lay-filter="sreach"
                                            lay-event="searchPaidFee">
                                        <i class="layui-icon">&#xe615;</i></button>
                                </div>
                            </form>
                        </div>
                    </script>
                    <%--表格区域--%>
                    <table class="layui-hide" id="paid_list" lay-filter="paid_list"></table>
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
            elem: '#paid_list'
            , url: 'fee/queryByDirectPay'
            , toolbar: '#paidToolBar' //开启头部工具栏，并为其绑定左侧模板
            , defaultToolbar: ['filter', 'exports', 'print']
            , cellMinWidth: 40
            , parseData: function (res) {
                return {
                    "code": res.code,
                    "msg": res.msg,
                    "count": res.data.totalSize,
                    "data": res.data.list
                }
            }
            , title: '已缴费列表'
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: 'feeId', title: '缴费ID', align: "center"}
                , {field: 'enterId', title: '入住ID', align: "center", sort: true}
                , {field: 'direct', title: '状态', align: "center", sort: true}
                , {field: 'coustomerId', title: '顾客ID', align: "center", sort: true}
                , {field: 'money', title: '金额', align: "center", sort: true}
                , {field: 'houseId', title: '房间ID', align: "center", sort: true}
                , {field: 'description', title: '描述', align: "center", sort: true}
                , {field: 'userId', title: '操作员ID', align: "center", sort: true}
                , {field: 'fee_type', title: '支付方式', align: "center", sort: true}
            ]]
            , page: true
            , limit: 10
            , limits: [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
        });

        //头工具栏事件
        table.on('toolbar(paid_list)', function (obj) {
            switch (obj.event) {
                case 'searchPaidFee':
                    table.reload('paid_list', {
                        url: 'fee/queryOneByIdPay',
                        where: {id: $("#searchPaidFeeNames").val()},
                        parseData: function (res) {
                            if (res.code === 0) {
                                return {
                                    "code": res.code,
                                    "msg": res.msg,
                                    "count": res.data.totalSize,
                                    "data": res.data.list
                                }
                            } else {
                                return {
                                    "code": res.code,
                                    "msg": res.msg,
                                    "count": 0,
                                }

                            }
                        }
                        , page: true
                        , limit: 10
                        , limits: [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
                    })
                    break;
            }
        });
    });
</script>
</body>
</html>
