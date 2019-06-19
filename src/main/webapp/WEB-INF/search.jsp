<%--
  Created by IntelliJ IDEA.
  User: sunqi
  Date: 19-6-18
  Time: 下午7:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>馆藏书籍</title>
    <script src="/ht/jquery/jquery-3.3.1.js"></script>
    <script src="/ht/bootstrap/js/bootstrap.js"></script>
    <script src="/ht/vue/vue.js"></script>
    <link rel='stylesheet' href="/ht/bootstrap/css/bootstrap.css">
    <link rel='stylesheet' href="/ht/bootstrap/css//bootstrap-grid.css">
    <link rel='stylesheet' href="/ht/bootstrap/css//bootstrap-reboot.css">

    <style type="text/css">
        .bookcontent{
            border: rgba(127,129,123,0.73) 3px solid;
            border-radius: 10px;
        }
    </style>

</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light" style="width: 100%;">
    <a class="navbar-brand" href="#" style="font-size: 30px;">xx图书馆</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent" style="margin-left: 40%;">
        <ul class="navbar-nav mr-auto" >
            <li class="nav-item" style="margin-right: 10px;">
                <a class="nav-link" href="#" style="font-size: 15px;">图书馆新闻</a>
            </li>
            <li class="nav-item" style="margin-right: 10px;">
                <a class="nav-link" href="#" style="font-size: 15px;">好书推荐</a>
            </li>
            <li class="nav-item active" style="margin-right: 10px;">
                <a class="nav-link" href北京大学图书馆="#" style="font-size: 15px;" data-toggle="modal" data-target="#myModal">我的图书馆</a>
            </li>

            <li class="nav-item" style="margin-right: 10px;">
                <a class="nav-link" href="#" style="font-size: 15px;">联系我们</a>
            </li>

            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-success my-2" type="submit">Search</button>
            </form>

        </ul>
    </div>
</nav>

<div id="content">

        <div style="margin-top: 5%;">
            <div id="search" style="margin-left: 30%;float: left;width: 30%;height: 5%;margin-top: -3px;">
                <input type="text" class="form-control" id="search1"  style="width: 100%;height: 100%;opacity: 0.8;">
            </div>
            <button type="submit" class="btn btn-primary" style="height: 4%;width: 6%;margin-left: 2%;">搜索</button>
        </div>

    <div id="books" class="bookcontent">

    </div>
</div>

</body>

<script>
    var bookcontent = new Vue({
        el:'#bookcontent',
        data:{
            books:${books},
            s:"${s}",
            showbooks:'',
            pageSize:2,
            totlePage:0,
            nowPage:1
        },
        mounted(){
            var _this = this;

        }
    })
</script>
</html>
