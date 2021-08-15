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
                <a href="">房间管理</a>
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
                    <script type="text/html" id="houseToolBar">
                        <div class="layui-card-body ">
                            <form class="layui-form layui-col-space5" onsubmit="return false;">
                                <div class="layui-inline layui-show-xs-block">
                                    <input type="text" id="houseNames" placeholder="请输入房间ID或房间名" autocomplete="off"
                                           class="layui-input"></div>
                                <div class="layui-inline layui-show-xs-block">
                                    <button class="layui-btn" lay-submit="" lay-filter="sreach"
                                            lay-event="getHouseByName">
                                        <i class="layui-icon">&#xe615;</i></button>
                                    <button class="layui-btn layui-btn-sm" lay-event="addHouse">新增</button>
                                </div>
                            </form>
                        </div>
                    </script>
                    <%--表格区域--%>
                    <table class="layui-hide" id="house_list" lay-filter="house_list"></table>
                    <%--操作按钮模块--%>
                    <script type="text/html" id="house_list_bar">
                        <a class="layui-btn layui-btn-xs" lay-event="editHouse">编辑</a>
                        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delHouse">删除</a>
                    </script>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 添加房间模态框 -->
<div class="site-text" style="margin: 5%; display: none" id="addHouseModel">
    <form class="layui-form">
        <div class="layui-form-item">
            <label class="layui-form-label">ID</label>
            <div class="layui-input-block">
                <input type="text" id="haddid" lay-verify="title" autocomplete="off" placeholder="请输入房间ID"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">房间名</label>
            <div class="layui-input-block">
                <input type="text" id="haddname" lay-verify="title" autocomplete="off" placeholder="请输入房间名"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">可住人数</label>
            <div class="layui-input-block">
                <input type="text" id="haddamount" lay-verify="title" autocomplete="off"
                       placeholder="请输入可住人数" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">价格</label>
            <div class="layui-input-block">
                <input type="text" id="haddprice" lay-verify="title" autocomplete="off" placeholder="请输入价格"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">楼层</label>
            <div class="layui-input-block">
                <input type="text" id="haddfloorId" lay-verify="title" autocomplete="off" placeholder="请输入楼层"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">状态</label>
            <div class="layui-input-block">
                <input type="text" id="haddstate" lay-verify="title" autocomplete="off" placeholder="请输入状态"
                       class="layui-input">
            </div>
        </div>
    </form>
</div>


<!-- 编辑房间模态框 -->
<div class="site-text" style="margin: 5%; display: none" id="editHouseModel">
    <form class="layui-form">
        <div class="layui-form-item">
            <label class="layui-form-label">ID</label>
            <div class="layui-input-block">
                <input type="text" id="hid" lay-verify="title" autocomplete="off" readonly disabled
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">房间名</label>
            <div class="layui-input-block">
                <input type="text" id="hname" lay-verify="title" autocomplete="off" placeholder="请输入房间名"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">可住人数</label>
            <div class="layui-input-block">
                <input type="text" id="hamount" lay-verify="title" autocomplete="off"
                       placeholder="请输入可住人数" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">价格</label>
            <div class="layui-input-block">
                <input type="text" id="hprice" lay-verify="title" autocomplete="off" placeholder="请输入价格"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">楼层</label>
            <div class="layui-input-block">
                <input type="text" id="hfloorId" lay-verify="title" autocomplete="off" placeholder="请输入楼层"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">状态</label>
            <div class="layui-input-block">
                <input type="text" id="hstate" lay-verify="title" autocomplete="off" placeholder="请输入状态"
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
            elem: '#house_list'
            , url: 'house/getallhuose'
            , toolbar: '#houseToolBar' //开启头部工具栏，并为其绑定左侧模板
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
            , title: '房间列表'
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: 'houseId', title: 'ID', hide: true}
                , {field: 'houseName', title: '房间名', fixed: 'left', unresize: true, align: "center", sort: true}
                , {field: 'amount', title: '可住人数', align: "center", sort: true}
                , {field: 'price', title: '价格', align: "center", sort: true}
                , {field: 'floorId', title: '楼层', align: "center", sort: true}
                , {field: 'state', title: '状态', align: "center", sort: true}
                , {field: 'customerId', title: '顾客ID', align: "center", sort: true}
                , {fixed: 'right', title: '操作', toolbar: '#house_list_bar'}
            ]]
            , page: true
            , limit: 10
            , limits: [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
        });

        //头工具栏事件
        table.on('toolbar(house_list)', function (obj) {
            switch (obj.event) {
                case 'getHouseByName':
                    // console.log($("#username").val())
                    table.reload('house_list', {
                        url: 'house/searchHouse',
                        where: {names: $("#houseNames").val()},
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
                case 'addHouse':
                    layer.open({
                        type: 1 //Page层类型
                        , skin: 'layui-layer-molv'
                        , area: ['600px', '460px']
                        , title: ['添加房间', 'font-size:18px']
                        , btn: ['保存', '取消']
                        , shadeClose: true
                        , shade: 0 //遮罩透明度
                        , maxmin: true //允许全屏最小化
                        , content: $("#addHouseModel")  //弹窗路径
                        , yes: function (index, layero) {
                            $.ajax({
                                url: "house/insertonehouse",
                                dataType: "json",
                                data: {
                                    houseId: $('#haddid').val(),
                                    houseName: $('#haddname').val(),
                                    amount:$('#haddamount').val(),
                                    price:$('#haddprice').val(),
                                    floorId:$('#haddfloorId').val(),
                                    state:$('#haddstate').val()
                                },
                                success: function (data) {
                                    if (data.code === 200) {
                                        layer.msg("房间信息" + data.message, {icon: 1, time: 3000}, function () {
                                            layer.close(index);
                                            location.reload();
                                        });
                                    } else {
                                        layer.msg("房间信息" + data.message + "请重试", {icon: 2, time: 3000});
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
        });

        //监听行工具事件
        table.on('tool(house_list)', function (obj) {
            let data = obj.data;
            //删除事件
            if (obj.event === 'delHouse') {
                layer.confirm('真的要删除' + data.houseName + "么？", {title: "提示"}, function (index) {
                    $.ajax({
                        url: "house/deleteHouse",
                        type: "get",
                        dataType: 'json',
                        data: {
                            house_id: data.houseId
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
            } else if (obj.event === 'editHouse') { //编辑事件
                layer.open({
                    type: 1 //Page层类型
                    , skin: 'layui-layer-molv'
                    , area: ['600px', '460px']
                    , title: ['修改房间信息', 'font-size:18px']
                    , btn: ['保存', '取消']
                    , shadeClose: true
                    , shade: 0 //遮罩透明度
                    , maxmin: true //允许全屏最小化
                    , content: $("#editHouseModel")  //弹窗路径
                    , success: function (layero, index) {
                        $('#hid').val(data.houseId);
                        $('#hname').val(data.houseName);
                        $('#hamount').val(data.amount);
                        $('#hprice').val(data.price);
                        $('#hfloorId').val(data.floorId);
                        $('#hstate').val(data.state);
                    }, yes: function (index, layero) {
                        $.ajax({
                            url: "house/updatehouse",
                            dataType: "json",
                            data: {
                                houseId: $('#hid').val(),
                                houseName: $('#hname').val(),
                                amount:$('#hamount').val(),
                                price:$('#hprice').val(),
                                floorId:$('#hfloorId').val(),
                                state:$('#hstate').val()
                            },
                            success: function (data) {
                                if (data.code === 200) {
                                    layer.msg("房间信息" + data.message, {icon: 1, time: 3000}, function () {
                                        layer.close(index);
                                        location.reload();
                                    });
                                } else {
                                    layer.msg("房间信息" + data.message + "请重试", {icon: 2, time: 3000});
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
</body>
</html>
