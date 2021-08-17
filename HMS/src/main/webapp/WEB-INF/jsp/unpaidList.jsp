<%--
  Created by IntelliJ IDEA.
  User: liuxing
  Date: 2021/8/16
  Time: 10:03
  File：unpaidList.jsp
  Email: liuxing997@foxmail.com
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>未缴费列表｜酒店后台管理系统</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <%--  引入公共样式和脚本文件  --%>
    <jsp:include page="common.jsp"/>
    <%--  引入支付模态框样式  --%>
    <link rel="stylesheet" href="alipay.css">
</head>
<body>
<div class="x-nav">
            <span class="layui-breadcrumb">
                <a href="">首页</a>
                <a href="">缴费管理</a>
                <a>
                    <cite>未缴费列表</cite></a>
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
                    <script type="text/html" id="unpaidToolBar">
                        <div class="layui-card-body ">
                            <form class="layui-form layui-col-space5" onsubmit="return false;">
                                <div class="layui-inline layui-show-xs-block">
                                    <input type="text" id="searchUnPaidFeeNames"
                                           placeholder="请输入缴费ID、入住ID、顾客ID、房间ID、操作员ID"
                                           autocomplete="off"
                                           class="layui-input" style="width: 300px;"></div>
                                <div class="layui-inline layui-show-xs-block">
                                    <button class="layui-btn" lay-submit="" lay-filter="sreach"
                                            lay-event="searchUnPaidFee">
                                        <i class="layui-icon">&#xe615;</i></button>
                                </div>
                            </form>
                        </div>
                    </script>
                    <%--表格区域--%>
                    <table class="layui-hide" id="unpaid_list" lay-filter="unpaid_list"></table>
                    <%--操作按钮模块--%>
                    <script type="text/html" id="unpaid_list_bar">
                        <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="alipay">支付宝</a>
                        <a class="layui-btn layui-btn-warm layui-btn-xs" lay-event="cashPayment">现金</a>
                    </script>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 支付宝支付模态框 -->
<div class="site-text" style="margin: 5%; display: none" id="aliPaymentModel">
    <form name=alipayment action="alipay" method="post"
          target="_blank">
        <div id="body1" class="show" name="divcontent">
            <dl class="content">
                <dt>缴费ID ：</dt>
                <dd>
                    <input id="FeeID" name="FeeID" readonly disabled/>
                </dd>
                <hr class="one_line">
                <dt>商户订单号 ：</dt>
                <dd>
                    <input id="WIDout_trade_no" name="WIDout_trade_no" readonly disabled/>
                </dd>
                <hr class="one_line">
                <dt>订单名称 ：</dt>
                <dd>
                    <input id="WIDsubject" name="WIDsubject" readonly disabled/>
                </dd>
                <hr class="one_line">
                <dt>付款金额 ：</dt>
                <dd>
                    <input id="WIDtotal_amount" name="WIDtotal_amount" readonly disabled/>
                </dd>
                <hr class="one_line">
                <dt>商品描述：</dt>
                <dd>
                    <input id="WIDbody" name="WIDbody" placeholder="请输入商品描述，默认：房费"/>
                </dd>
                <hr class="one_line">
                <dt></dt>
                <dd id="btn-dd">
						<span class="new-btn-login-sp">
							<button class="new-btn-login" type="submit"
                                    style="text-align: center;">确认付 款</button>
						</span> <span class="note-help">如果您点击“付款”按钮，即表示您同意本次付款操作。</span>
                </dd>
            </dl>
        </div>
    </form>
</div>
<!-- 现金支付模态框 -->
<div class="site-text" style="margin: 5%; display: none" id="cashPaymentModel">
    <form class="layui-form">
        <div class="layui-form-item">
            <label for="cashFeeId" class="layui-form-label">缴费ID</label>
            <div class="layui-input-block">
                <input type="text" id="cashFeeId" readonly disabled autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="cashEnterId" class="layui-form-label">入住ID</label>
            <div class="layui-input-block">
                <input type="text" id="cashEnterId" readonly disabled autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="cashCoustomerId" class="layui-form-label">顾客ID</label>
            <div class="layui-input-block">
                <input type="text" id="cashCoustomerId" readonly disabled autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="cashHouseId" class="layui-form-label">房间ID</label>
            <div class="layui-input-block">
                <input type="text" id="cashHouseId" readonly disabled autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="cashDescription" class="layui-form-label">入住人数</label>
            <div class="layui-input-block">
                <input type="text" id="cashDescription" readonly disabled autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="cashUserId" class="layui-form-label">操作员ID</label>
            <div class="layui-input-block">
                <input type="text" id="cashUserId" readonly disabled autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="cashMoney" class="layui-form-label">待缴金额</label>
            <div class="layui-input-block">
                <input type="text" id="cashMoney" readonly disabled autocomplete="off"
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
            elem: '#unpaid_list'
            , url: 'fee/queryByDirectNoPay'
            , toolbar: '#unpaidToolBar' //开启头部工具栏，并为其绑定左侧模板
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
            , title: '未缴费列表'
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: 'feeId', title: '缴费ID', align: "center"}
                , {field: 'enterId', title: '入住ID', align: "center", sort: true}
                , {field: 'direct', title: '状态', align: "center", sort: true}
                , {field: 'coustomerId', title: '顾客ID', align: "center", sort: true}
                , {field: 'money', title: '待缴金额', align: "center", sort: true}
                , {field: 'houseId', title: '房间ID', align: "center", sort: true}
                , {field: 'description', title: '描述', align: "center", sort: true}
                , {field: 'userId', title: '操作员ID', align: "center", sort: true}
                , {field: 'fee_type', title: '支付方式', align: "center", sort: true}
                , {fixed: 'right', title: '确认支付', width: 160, align: "center", toolbar: '#unpaid_list_bar'}
            ]]
            , page: true
            , limit: 10
            , limits: [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
        });

        //头工具栏事件
        table.on('toolbar(unpaid_list)', function (obj) {
            switch (obj.event) {
                case 'searchUnPaidFee': //搜索未缴费信息
                    table.reload('unpaid_list', {
                        url: 'fee/queryOneByIdNoPay',
                        where: {id: $("#searchUnPaidFeeNames").val()},
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
        //监听行工具事件
        table.on('tool(unpaid_list)', function (obj) {
            let data = obj.data;
            if (obj.event === 'alipay') {//支付宝支付
                layer.open({
                    type: 1 //Page层类型
                    , skin: 'layui-layer-molv'
                    , area: '600px'
                    , title: ['支付宝支付', 'font-size:18px']
                    , btn: ['取消支付']
                    , shadeClose: true
                    , shade: 0
                    , maxmin: true
                    , content: $("#aliPaymentModel")  //弹窗路径
                    , success: function (layero, index) {
                        layer.iframeAuto(index)//自适应高度
                        $("#WIDsubject").val("顾客" + data.coustomerId + "的房费");
                        $("#WIDtotal_amount").val(data.money);
                        $("#FeeID").val(data.feeId);
                    }
                });
            } else if (obj.event === 'cashPayment') { //现金支付
                layer.open({
                    type: 1 //Page层类型
                    , skin: 'layui-layer-molv'
                    , area: '600px'
                    , title: ['现金支付', 'font-size:18px']
                    , btn: ['已支付', '未支付']
                    , shadeClose: true
                    , shade: 0
                    , maxmin: true
                    , content: $("#cashPaymentModel")  //弹窗路径
                    , success: function (layero, index) {
                        layer.iframeAuto(index)//自适应高度
                        $('#cashFeeId').val(data.feeId);
                        $('#cashEnterId').val(data.enterId);
                        $('#cashCoustomerId').val(data.coustomerId);
                        $('#cashHouseId').val(data.houseId);
                        $('#cashDescription').val(data.description);
                        $('#cashUserId').val(data.userId);
                        $('#cashMoney').val(data.money);
                    }, yes: function (index, layero) {
                        $.ajax({
                            url: "fee/cashPayment",
                            dataType: "json",
                            data: {
                                feeId: $("#cashFeeId").val(),
                            },
                            success: function (data) {
                                if (data.code === 200) {
                                    layer.msg(data.message, {icon: 1, time: 3000}, function () {
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
            }
        });
    });
</script>
<script>
    //生成订单号
    function GetDateNow() {
        var vNow = new Date();
        var sNow = "";
        sNow += String(vNow.getFullYear());
        sNow += String(vNow.getMonth() + 1);
        sNow += String(vNow.getDate());
        sNow += String(vNow.getHours());
        sNow += String(vNow.getMinutes());
        sNow += String(vNow.getSeconds());
        sNow += String(vNow.getMilliseconds());
        $("#WIDout_trade_no").val(sNow);
    }

    GetDateNow();
</script>
</body>
</html>
