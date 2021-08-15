<%@ page import="com.hqyj.seven.pojo.House" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<%
  String basePath = request.getContextPath();
  List<House> house = (List<House>) session.getAttribute("houselist");
%>
<html class="x-admin-sm">
<head>
  <meta charset="UTF-8">
  <title>入住｜酒店后台管理系统</title>
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
      <div class="layui-form-item">
        <label for="day" class="layui-form-label">入住天数</label>
        <div class="layui-input-block">
          <input type="text" name="day" id="day" placeholder="请输入入住天数" autocomplete="off"
                 class="layui-input">
        </div>
      </div>
      <div class="layui-form-item">
        <label for="numberOfPeople" class="layui-form-label">入住人数</label>
        <div class="layui-input-block">
          <input type="text" name="numberOfPeople" id="numberOfPeople" placeholder="请输入入住人数" autocomplete="off"
                 class="layui-input">
        </div>
      </div>
      <div class="layui-form-item">
        <label for="userId" class="layui-form-label">操作员id</label>
        <div class="layui-input-block">
          <input type="text" name="userId" id="userId" placeholder="请输入操作员id" autocomplete="off"
                 class="layui-input">
        </div>
      </div>
      <div class="layui-input-block">
        <button type="button" class="layui-btn layui-btn-normal" onclick="reservation()">入住</button></div>
    </form>

  </div>
</div>


<script>
  $(function () {
     let user = JSON.parse(localStorage.getItem("user"));

    $("#userId").val(user.id);

  });
  function reservation()
  {
    $.ajax({
      url:"house/checkIn",
      dataType:"json",
      data:
              {
                customerId:$("#customerId").val(),
                name:$("#houseName").val(),
                day:$("#day").val(),
                numberOfPeople:$("#numberOfPeople").val(),
                userId:$("#userId").val()
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
