<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<%
    String basePath = request.getContextPath();
%>
<html class="x-admin-sm">

<head>
    <meta charset="UTF-8">
    <title>房间列表｜酒店后台管理系统</title>
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
                <a href="">订房管理</a>
                <a>
                    <cite>房间列表</cite></a>
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
                    <script type="text/html" id="reservationToolBar">
                        <div class="layui-card-body ">
                            <form class="layui-form layui-col-space5" onsubmit="return false;">
                                <div class="layui-inline layui-show-xs-block">
                                    <input type="text" id="reservationNames" placeholder="请输入房间ID或房间名"
                                           autocomplete="off"
                                           class="layui-input"></div>
                                <div class="layui-inline layui-show-xs-block">
                                    <button class="layui-btn" lay-submit="" lay-filter="sreach"
                                            lay-event="getReservationByName">
                                        <i class="layui-icon">&#xe615;</i></button>
                                </div>
                            </form>
                        </div>
                    </script>
                    <%--表格区域--%>
                    <table class="layui-hide" id="reservation_list" lay-filter="reservation_list"></table>
                    <%--操作按钮模块--%>
                    <script type="text/html" id="reservation_list_bar">
                        <a class="layui-btn layui-btn-xs" lay-event="reservation">订房</a>
                        <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="checkin">入住</a>
                        <a class="layui-btn layui-btn-warm layui-btn-xs " lay-event="unsubscribe">退订</a>
                        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="checkout">退房</a>
                    </script>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 订房模态框 -->
<div class="site-text" style="margin: 5%; display: none" id="reservationModel">
    <form class="layui-form">
        <div class="layui-form-item">
            <label class="layui-form-label">顾客ID</label>
            <div class="layui-input-block">
                <input type="text" id="customerId" lay-verify="title" autocomplete="off"  placeholder="请输入顾客ID"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">房间号</label>
            <div class="layui-input-block">
                <input type="text" id="houseName" lay-verify="title" autocomplete="off" readonly disabled
                       class="layui-input">
            </div>
        </div>
    </form>
</div>

<!-- 入住模态框 -->
<div class="site-text" style="margin: 5%; display: none" id="checkinModel">
    <form class="layui-form">
        <div class="layui-form-item">
            <label for="checkinCustomerId" class="layui-form-label">顾客ID</label>
            <div class="layui-input-block">
                <input type="text"  id="checkinCustomerId" autocomplete="off" placeholder="请输入顾客ID"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="checkinHouseName" class="layui-form-label">房间号</label>
            <div class="layui-input-block">
                <input type="text"  id="checkinHouseName" readonly disabled autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="checkinDay" class="layui-form-label">入住天数</label>
            <div class="layui-input-block">
                <input type="text"  id="checkinDay" placeholder="请输入入住天数" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="checkinPeople" class="layui-form-label">入住人数</label>
            <div class="layui-input-block">
                <input type="text" id="checkinPeople" placeholder="请输入入住人数" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="userId" class="layui-form-label">操作员ID</label>
            <div class="layui-input-block">
                <input type="text"  id="userId" readonly disabled autocomplete="off"
                       class="layui-input">
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
            elem: '#reservation_list'
            , url: 'house/getAllHouse'
            , toolbar: '#reservationToolBar' //开启头部工具栏，并为其绑定左侧模板
            , defaultToolbar: ['filter', 'exports', 'print']
            , parseData: function (res) {
                return {
                    "code": res.code,
                    "msg": res.msg,
                    "count": res.data.totalSize,
                    "data": res.data.list
                }
            }
            , title: '订房列表'
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {
                    field: 'houseId', title: 'ID', width: 120,
                    fixed: 'left',
                    unresize: true,
                    align: "center",
                    sort: true
                }
                , {
                    field: 'houseName',
                    title: '房间名',
                    width: 120,
                    align: "center",
                    sort: true
                }
                , {field: 'amount', title: '可住人数', width: 120, align: "center", sort: true}
                , {field: 'price', title: '价格', width: 120, align: "center", sort: true}
                , {field: 'floorId', title: '楼层', width: 120, align: "center", sort: true}
                , {field: 'state', title: '状态', width: 120, align: "center", sort: true}
                , {field: 'customerId', title: '顾客ID', width: 150, align: "center", sort: true}
                , {fixed: 'right', title: '操作', width: 250, align: "center", toolbar: '#reservation_list_bar'}
            ]]
            , page: true
            , limit: 10
            , limits: [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
        });

        //头工具栏事件
        table.on('toolbar(reservation_list)', function (obj) {
            switch (obj.event) {
                case 'getReservationByName':
                    table.reload('reservation_list', {
                        url: 'house/searchHouse',
                        where: {names: $("#reservationNames").val()},
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
        table.on('tool(reservation_list)', function (obj) {
            let data = obj.data;
            //订房
            if (obj.event === 'reservation') {
                layer.open({
                    type: 1 //Page层类型
                    , skin: 'layui-layer-molv'
                    , area: ['600px', '250px']
                    , title: ['预订房间', 'font-size:18px']
                    , btn: ['预订', '取消']
                    , shadeClose: true
                    , shade: 0
                    , maxmin: true
                    , content: $("#reservationModel")  //弹窗路径
                    , success: function (layero, index) {
                        $('#houseName').val(data.houseName);

                    }, yes: function (index, layero) {
                        $.ajax({
                            url: "house/reservation",
                            dataType: "json",
                            data: {
                                customerId:$("#customerId").val(),
                                name:$("#houseName").val()
                            },
                            success: function (data) {
                                if (data.code === 200) {
                                    layer.msg("恭喜您！" + data.message, {icon: 1, time: 3000}, function () {
                                        layer.close(index);
                                        location.reload();
                                    });
                                } else {
                                    layer.msg(data.message + "请重试", {icon: 2, time: 3000});
                                }
                            },
                            error: function (err) {
                                layer.msg('服务器走丢啦！', {icon: 7, time: 3000});
                            }
                        });
                    }
                });

            } else if (obj.event === 'checkin') { //入住
                layer.open({
                    type: 1 //Page层类型
                    , skin: 'layui-layer-molv'
                    , area: '600px'
                    , title: ['顾客入住', 'font-size:18px']
                    , btn: ['入住', '取消']
                    , shadeClose: true
                    , shade: 0 //遮罩透明度
                    , maxmin: true //允许全屏最小化
                    , content: $("#checkinModel")  //弹窗路径
                    , success: function (layero, index) {
                        layer.iframeAuto(index)//高度自适应
                        $('#checkinHouseName').val(data.houseName);
                        $('#userId').val(JSON.parse(localStorage.getItem("user")).id);
                    }, yes: function (index, layero) {
                        console.log($("#checkinCustomerId").val(),$("#checkinHouseName").val(),
                            $("#checkinDay").val(),$("#checkinPeople").val(),$("#userId").val())
                        $.ajax({
                            url: "house/checkIn",
                            dataType: "json",
                            data: {
                                customerId:$("#checkinCustomerId").val(),
                                name:$("#checkinHouseName").val(),
                                day:$("#checkinDay").val(),
                                numberOfPeople:$("#checkinPeople").val(),
                                userId:$("#userId").val()
                            },
                            success: function (data) {
                                if (data.code === 200) {
                                    layer.msg(data.message, {icon: 1, time: 3000}, function () {
                                        layer.close(index);
                                        location.reload();
                                    });
                                }else if (data.code === -9){
                                    layer.msg(data.message, {icon: 2, time: 3000});
                                }else {
                                    layer.msg(data.message + "，请重试！", {icon: 2, time: 3000});
                                }
                            },
                            error: function (err) {
                                console.log(err);
                                layer.msg('服务器走丢啦！', {icon: 7, time: 3000});
                            }
                        });
                    }
                });
            }else if (obj.event === 'unsubscribe'){//退订
                layer.confirm('真的要退订' + data.houseName + "么？", {title: "提示"}, function (index) {
                    $.ajax({
                        url: "house/unsubscribe",
                        type: "get",
                        dataType: 'json',
                        data: {
                            name: data.houseName
                        },
                        success: function (res) {
                            if (res.code === 200) {
                                layer.msg(res.message, {icon: 1, time: 3000}, function () {
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
            }else if (obj.event === 'checkout'){//退房
                layer.confirm('确定退房吗？', {title: "提示"}, function (index) {
                    $.ajax({
                        url: "house/checkOut",
                        type: "get",
                        dataType: 'json',
                        data: {
                            name: data.houseName
                        },
                        success: function (res) {
                            if (res.code === 200) {
                                layer.msg(res.message, {icon: 1, time: 3000}, function () {
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
</html>
