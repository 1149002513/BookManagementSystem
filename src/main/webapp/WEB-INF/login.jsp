<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: sunqi
  Date: 19-6-10
  Time: 上午10:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="/ht/jquery/jquery-3.3.1.js"></script>
    <script src="/ht/bootstrap/js/bootstrap.js"></script>
    <link rel='stylesheet' href="/ht/bootstrap/css/bootstrap.css">
    <link rel='stylesheet' href="/ht/bootstrap/css//bootstrap-grid.css">
    <link rel='stylesheet' href="/ht/bootstrap/css//bootstrap-reboot.css">
    <style type="text/css">
        body{
            background-image: url("/ht/xitongpic/dlbj.jpg");
            background-size: 100% 100%;
        }
    </style>
</head>
<body>

<div style="width: 50%; height: 60%; margin-left: 25%;margin-top: 10%; border: rgba(96,172,120,0.96) 4px solid;border-radius: 10px;">
    <div style="width: 80%;height: 100%; margin-left: 10%;margin-top: 10%;">
        <h2>欢迎使用图书管理系统</h2>
        <form:form id="myform" modelAttribute="yonghu" action="logining">
            <div class="form-group">
                <label for="name">账号</label>
                <form:input path="name" type="text" class="form-control" id="name" placeholder="请输入账号" />
            </div>

            <div class="form-group">
                <label for="password">密码</label>
                <form:input path="password" type="password" class="form-control" id="password" placeholder="请输入密码" />
            </div>

            <button type="submit" class="btn btn-primary">登录</button>
            <span style="float: right;">还没有账号？ <a href="#">立即注册</a></span>
        </form:form>
    </div>
</div>

</body>
</html>
