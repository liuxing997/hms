<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>房间列表｜酒店后台管理系统</title>
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
                                           class="layui-input" style="width: 200px;"></div>
                                <div class="layui-inline layui-show-xs-block">
                                    <button class="layui-btn" lay-submit="" lay-filter="sreach"
                                            lay-event="searchHouseByName">
                                        <i class="layui-icon">&#xe615;</i></button>
                                    <button class="layui-btn layui-btn-sm" lay-event="addOneHouse">新增</button>
                                </div>
                            </form>
                        </div>
                    </script>
                    <%--表格区域--%>
                    <table class="layui-hide" id="house_list" lay-filter="house_list"></table>
                    <%--操作按钮模块--%>
                    <script type="text/html" id="house_list_bar">
                        <a class="layui-btn layui-btn-xs" lay-event="editOneHouse">编辑</a>
                        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delOneHouse">删除</a>
                    </script>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 添加房间模态框 -->
<div class="site-text" style="margin: 5%; display: none" id="addOneHouseModel">
    <form class="layui-form">
        <div class="layui-form-item">
            <label for="houseAddId" class="layui-form-label">ID</label>
            <div class="layui-input-block">
                <input type="text" id="houseAddId" lay-verify="title" autocomplete="off" placeholder="请输入房间ID"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="houseAddName" class="layui-form-label">房间名</label>
            <div class="layui-input-block">
                <input type="text" id="houseAddName" lay-verify="title" autocomplete="off" placeholder="请输入房间名"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="houseAddAmount" class="layui-form-label">可住人数</label>
            <div class="layui-input-block">
                <input type="text" id="houseAddAmount" lay-verify="title" autocomplete="off"
                       placeholder="请输入可住人数" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="houseAddPrice" class="layui-form-label">价格</label>
            <div class="layui-input-block">
                <input type="text" id="houseAddPrice" lay-verify="title" autocomplete="off" placeholder="请输入价格"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="houseAddFloorId" class="layui-form-label">楼层</label>
            <div class="layui-input-block">
                <input type="text" id="houseAddFloorId" lay-verify="title" autocomplete="off" placeholder="请输入楼层"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="houseAddState" class="layui-form-label">状态</label>
            <div class="layui-input-block">
                <select id="houseAddState" lay-filter="houseAddState">
                    <option value="空闲" selected>空闲</option>
                </select>
            </div>
        </div>
    </form>
</div>

<!-- 编辑房间模态框 -->
<div class="site-text" style="margin: 5%; display: none" id="editOneHouseModel">
    <form class="layui-form">
        <div class="layui-form-item">
            <label for="houseEditId" class="layui-form-label">ID</label>
            <div class="layui-input-block">
                <input type="text" id="houseEditId" lay-verify="title" autocomplete="off" readonly disabled
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="houseEditName" class="layui-form-label">房间名</label>
            <div class="layui-input-block">
                <input type="text" id="houseEditName" lay-verify="title" autocomplete="off" placeholder="请输入房间名"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="houseEditAmount" class="layui-form-label">可住人数</label>
            <div class="layui-input-block">
                <input type="text" id="houseEditAmount" lay-verify="title" autocomplete="off"
                       placeholder="请输入可住人数" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">价格</label>
            <div class="layui-input-block">
                <input type="text" id="houseEditPrice" lay-verify="title" autocomplete="off" placeholder="请输入价格"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">楼层</label>
            <div class="layui-input-block">
                <input type="text" id="houseEditFloorId" lay-verify="title" autocomplete="off" placeholder="请输入楼层"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">状态</label>
            <div class="layui-input-block">
                <select id="houseEditState" lay-filter="houseEditState">
                    <option value="空闲" selected>空闲</option>
                    <option value="维修">维修</option>
                    <option value="打扫">打扫</option>
                </select>
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
            , url: 'house/getAllHouse'
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
                case 'searchHouseByName'://搜索房间
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
                case 'addOneHouse': //添加房间
                    layer.open({
                        type: 1 //Page层类型
                        , skin: 'layui-layer-molv'
                        , area: '600px'
                        , title: ['添加房间', 'font-size:18px']
                        , btn: ['添加', '取消']
                        , shadeClose: true
                        , shade: 0 //遮罩透明度
                        , maxmin: true //允许全屏最小化
                        , content: $("#addOneHouseModel")  //弹窗路径
                        , yes: function (index, layero) {
                            layer.iframeAuto(index)//高度自适应
                            let houseAddId = $('#houseAddId').val();
                            let houseAddName = $('#houseAddName').val();
                            let houseAddAmount = $('#houseAddAmount').val();
                            let houseAddPrice = $('#houseAddPrice').val();
                            let houseAddFloorId = $('#houseAddFloorId').val();
                            let houseAddState = $('#houseAddState').val();
                            if (houseAddId.length !== 0 && houseAddName.length !== 0 && houseAddAmount.length !== 0 && houseAddPrice.length !== 0 && houseAddFloorId.length !== 0 && houseAddState.length !== 0) {
                                layer.msg("请填写完整信息！", {icon: 2, time: 3000});
                            } else if (houseAddId.length === 0) {
                                layer.msg("房间ID不能为空！", {icon: 2, time: 3000});
                            } else if (houseAddName.length === 0) {
                                layer.msg("房间名不能为空！", {icon: 2, time: 3000});
                            } else if (houseAddAmount.length === 0) {
                                layer.msg("可住人数不能为空！", {icon: 2, time: 3000});
                            } else if (houseAddPrice.length === 0) {
                                layer.msg("价格不能为空！", {icon: 2, time: 3000});
                            } else if (houseAddFloorId.length === 0) {
                                layer.msg("楼层不能为空！", {icon: 2, time: 3000});
                            } else if (houseAddState.length === 0) {
                                layer.msg("状态不能为空！", {icon: 2, time: 3000});
                            } else if (houseAddId.length !== 0 && houseAddName.length !== 0 && houseAddAmount.length !== 0 && houseAddPrice.length !== 0 && houseAddFloorId.length !== 0 && houseAddState.length !== 0) {
                                $.ajax({
                                    url: "house/insertOneHouse",
                                    dataType: "json",
                                    data: {
                                        houseId: houseAddId,
                                        houseName: houseAddName,
                                        amount: houseAddAmount,
                                        price: houseAddPrice,
                                        floorId: houseAddFloorId,
                                        state: houseAddState
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
                        }
                    });
                    break;
            }
        });

        //监听行工具事件
        table.on('tool(house_list)', function (obj) {
            let data = obj.data;
            if (obj.event === 'delOneHouse') { //删除房间
                switch (data.state) {
                    case '已定':
                        layer.msg(data.houseName + "房间已被顾客预订, 暂时不能删除哦！", {icon: 2, time: 3000});
                        break;
                    case '入住':
                        layer.msg(data.houseName + "房间已有顾客入住, 暂时不能删除哦！", {icon: 2, time: 3000});
                        break;
                    case '打扫':
                        layer.msg(data.houseName + "房间正在打扫中, 暂时不能删除哦！", {icon: 2, time: 3000});
                        break;
                    case '维修':
                        layer.msg(data.houseName + "房间正在维修中, 暂时不能删除哦！", {icon: 2, time: 3000});
                        break;
                    case '空闲':
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
                        break;
                }
            } else if (obj.event === 'editOneHouse') { //编辑房间
                switch (data.state) {
                    case '已定':
                        layer.msg(data.houseName + "房间已被顾客预订, 暂时不能编辑哦！", {icon: 2, time: 3000});
                        break;
                    case '入住':
                        layer.msg(data.houseName + "房间已有顾客入住, 暂时不能编辑哦！", {icon: 2, time: 3000});
                        break;
                    case '打扫':
                        layer.msg(data.houseName + "房间正在打扫中, 暂时不能编辑哦！", {icon: 2, time: 3000});
                        break;
                    case '维修':
                        layer.msg(data.houseName + "房间正在维修中, 暂时不能编辑哦！", {icon: 2, time: 3000});
                        break;
                    case '空闲':
                        layer.open({
                            type: 1 //Page层类型
                            , skin: 'layui-layer-molv'
                            , area: ['600px', '460px']
                            , title: ['修改房间信息', 'font-size:18px']
                            , btn: ['保存', '取消']
                            , shadeClose: true
                            , shade: 0 //遮罩透明度
                            , maxmin: true //允许全屏最小化
                            , content: $("#editOneHouseModel")  //弹窗路径
                            , success: function (layero, index) {
                                $('#houseEditId').val(data.houseId);
                                $('#houseEditName').val(data.houseName);
                                $('#houseEditAmount').val(data.amount);
                                $('#houseEditPrice').val(data.price);
                                $('#houseEditFloorId').val(data.floorId);
                                $('#houseEditState').val(data.state);
                            }, yes: function (index, layero) {
                                let houseEditId = $('#houseEditId').val();
                                let houseEditName = $('#houseEditName').val();
                                let houseEditAmount = $('#houseEditAmount').val();
                                let houseEditPrice = $('#houseEditPrice').val();
                                let houseEditFloorId = $('#houseEditFloorId').val();
                                let houseEditState = $('#houseEditState').val();
                                if (houseEditId.length === 0 && houseEditName.length === 0 && houseEditAmount.length === 0 && houseEditPrice.length === 0 && houseEditFloorId.length === 0 && houseEditState.length === 0) {
                                    layer.msg("请先填写完整信息！", {icon: 2, time: 3000});
                                } else if (houseEditId.length == 0) {
                                    layer.msg("房间ID不能为空！", {icon: 2, time: 3000});
                                } else if (houseEditName.length === 0) {
                                    layer.msg("房间名不能为空！", {icon: 2, time: 3000});
                                } else if (houseEditAmount.length === 0) {
                                    layer.msg("入住人数不能为空！", {icon: 2, time: 3000});
                                } else if (houseEditPrice.length === 0) {
                                    layer.msg("客房金额不能为空！", {icon: 2, time: 3000});
                                } else if (houseEditFloorId.length === 0) {
                                    layer.msg("楼层不能为空！", {icon: 2, time: 3000});
                                } else if (houseEditState.length === 0) {
                                    layer.msg("客房状态不能为空！", {icon: 2, time: 3000});
                                } else if (houseEditId.length !== 0 && houseEditName.length !== 0 && houseEditAmount.length !== 0 && houseEditPrice.length !== 0 && houseEditFloorId.length !== 0 && houseEditState.length !== 0) {
                                    $.ajax({
                                        url: "house/updateOneHouse",
                                        dataType: "json",
                                        data: {
                                            houseId: houseEditId,
                                            houseName: houseEditName,
                                            amount: houseEditAmount,
                                            price: houseEditPrice,
                                            floorId: houseEditFloorId,
                                            state: houseEditState
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
                            }
                        });
                        break;
                }
            }
        });
    });
</script>
</body>
</html>
