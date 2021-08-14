<%--
  Created by IntelliJ IDEA.
  User: liuxing
  Date: 2021/8/13
  Time: 21:38
  File：person.jsp
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
    <title>订单｜酒店后台管理系统</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <jsp:include page="common.jsp"/>
</head>
<body>
<div class="layui-card">
    <div class="layui-card-body">
        <form class="layui-form" id="person">

            <div class="layui-form-item">
                <label for="customerId" class="layui-form-label">顾客id</label>
                <div class="layui-input-block">
                    <input type="text" name="customerId" id="customerId" autocomplete="off" placeholder="请输顾客id"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="houseName" class="layui-form-label">房间号</label>
                <div class="layui-input-block">
                    <input type="text" name="houseName" id="houseName" placeholder="请输房间号" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-input-block">
                <button type="button" class="layui-btn layui-btn-normal" onclick="reservation()">订房</button></div>>
        </form>

    </div>
</div>


<script>
    $(function () {
        let house = JSON.parse(localStorage.getItem("house"));


        $("#houseName").val(house.houseName);

    });
  function reservation()
  {
      $.ajax({
          url:"house/reservation",
          dataType:"json",
          data:
              {
                  customerId:$("#customerId").val(),
                  name:$("#houseName").val()
              },
          success:function (data){

              alert(data.massage)
              console.log(data.massage)
              var index = parent.layer.getFrameIndex(window.name);
              //表格重载 就相当于 刷新父页面的表格-dataTable是父页面的表格ID属性
              parent.layui.table.reload('dataTable');
              //关闭当前frame
              parent.layer.close(index);

              xadmin.father_reload();


          }
      })
  }



</script>
</body>
</html>
