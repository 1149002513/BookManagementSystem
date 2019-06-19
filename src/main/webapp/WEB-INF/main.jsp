<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: sunqi
  Date: 19-6-12
  Time: 上午11:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
    <script src="/ht/jquery/jquery-3.3.1.js"></script>
    <script src="/ht/bootstrap/js/bootstrap.js"></script>
    <script src="/ht/vue/vue.js"></script>
    <link rel='stylesheet' href="/ht/bootstrap/css/bootstrap.css">
    <link rel='stylesheet' href="/ht/bootstrap/css//bootstrap-grid.css">
    <link rel='stylesheet' href="/ht/bootstrap/css//bootstrap-reboot.css">
    <style type="text/css">
        body{
            background-image: url("/ht/xitongpic/tsgbj.jpg");
            background-size: 100% 100%;
        }

        @keyframes formousword {
            0%{
                opacity: 1;
            }

            25%{
                opacity: 1;
            }

            50%{
                opacity: 1;
            }

            75%{
                opacity: 1;
            }

            100%{
                opacity: 0.0;
            }
        }

        .contentforword{

        }

        @keyframes warn1 {
            0% {
                transform: scale(0.3);
                -webkit-transform: scale(0.3);
                opacity: 0.0;
            }

            25% {
                transform: scale(0.3);
                -webkit-transform: scale(0.3);
                opacity: 0.1;
            }

            50% {
                transform: scale(0.3);
                -webkit-transform: scale(0.3);
                opacity: 0.3;
            }

            75% {
                transform: scale(0.5);
                -webkit-transform: scale(0.5);
                opacity: 0.5;
            }

            100% {
                transform: scale(0.8);
                -webkit-transform: scale(0.8);
                opacity: 0.0;
            }
        }

        .pulse1 {
            position: absolute;
            width: 100px;
            height: 100px;
            left: 25%;
            top: 17%;
            border: 6px solid red;
            -webkit-border-radius: 50%;
            -moz-border-radius: 50%;
            border-radius: 50%;
            z-index: 1;
            opacity: 0;
            -webkit-animation: warn1 2s ease-out;
            -moz-animation: warn1 2s ease-out;
            animation: warn1 2s ease-out;
            -webkit-animation-iteration-count: infinite;
            -moz-animation-iteration-count: infinite;
            animation-iteration-count: infinite;
            box-shadow: 1px 1px 30px red;
        }

        .searchicon{
            position: absolute;
            left: 25%;
            top: 17%;
            width: 100px;
            height: 100px;
        }

        .word{
            position: absolute;
            left: 3px;
            top: 50%;
            width: 100%;
            -webkit-animation: formousword 2s ease-out;
            -moz-animation: formousword 2s ease-out;
            animation: formousword 2s ease-out;
            -webkit-animation-iteration-count: infinite;
            -moz-animation-iteration-count: infinite;
            animation-iteration-count: infinite;
        }
        #content{
            width: 100%;
            /*height: 79%;*/
        }

    </style>
</head>
<body>

<%--注册模态框--%>
<div class="box-tools pull-right">
    <div class="modal fade" id="resModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="resModalLabel">
                        账号申请
                    </h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                </div>
                <div class="modal-body">
                    <form:form modelAttribute="yonghu" action="regist" target="_blank">
                    <form:input path="name" class="form-control width-120" placeholder="输入账号"  />
                    <br><br>
                    <form:input path="password" class="form-control width-120" placeholder="输入密码"  />

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="submit" class="btn btn-primary">
                        申请
                    </button>
                    </form:form>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
</div>


<%--登录模态框--%>
<div class="box-tools pull-right">
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel">
                        登录
                    </h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                </div>
            <div class="modal-body">
                <form:form modelAttribute="yonghu" action="logining" target="_blank">
                    <form:input path="name" class="form-control width-120" placeholder="输入账号"  />
                    <br><br>
                    <form:input path="password" class="form-control width-120" placeholder="输入密码"  />

            </div>
            <div class="modal-footer">
                <a class="nav-link" href="#" style="color: #a8bbff;font-size: 15px;" data-toggle="modal" data-target="#resModal" data-dismiss="modal">没有账号？立即申请</a>
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="submit" class="btn btn-primary">
                    登录
                </button>
                </form:form>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</div>




<div class="pulse1"></div>
<div class="searchicon">
    <center>
        <img src="/ht/xitongpic/search_146px_1223096_easyicon.net.png" width="20px;" height="20px;" style="margin-top: 40px" >
    </center>
</div>

<nav class="navbar navbar-expand-lg navbar-light" style="width: 100%;">
    <a class="navbar-brand" href="#" style="font-size: 30px;">xx图书馆</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent" style="margin-left: 40%;">
        <ul class="navbar-nav mr-auto" >
            <li class="nav-item" style="margin-right: 10px;">
                <a class="nav-link" href="#" style="color: #ffffff;font-size: 15px;">图书馆新闻</a>
            </li>
            <li class="nav-item" style="margin-right: 10px;">
                <a class="nav-link" href="#" style="color: #ffffff;font-size: 15px;">好书推荐</a>
            </li>
            <li class="nav-item active" style="margin-right: 10px;">
                <a class="nav-link" href北京大学图书馆="#" style="color: #ffffff;font-size: 15px;" data-toggle="modal" data-target="#myModal">我的图书馆</a>
            </li>

            <li class="nav-item" style="margin-right: 10px;">
                <a class="nav-link" href="#" style="color: #ffffff;font-size: 15px;">联系我们</a>
            </li>

            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-success my-2" type="submit">Search</button>
            </form>

        </ul>
    </div>
</nav>


<div id="content">

    <div style="float: left; margin-left: 26%;margin-right: 4%; width: 70px;height: 70px;">
    </div>

    <form action="/search">

        <div style="margin-top: 5%;">
            <div id="search" style="float: left;width: 30%;height: 9%;margin-top: -3px;">
                <input type="text" class="form-control" id="search1"  style="width: 100%;height: 100%;opacity: 0.8;">
            </div>
            <button type="submit" class="btn btn-primary" style="height: 7%;width: 6%;margin-left: 2%;">搜索</button>
        </div>
    </form>


    <div id="app-1" class="word">
        <div id="words" style="width: 60%;">
            <h1 style="color: #f8f9ff;font-size: 40px;margin-left: 20%;">{{showword}}</h1>
        </div>
        <div id="author">
            <h3 style="color: #f8f9ff;font-size: 30px;margin-right: 10%;float: right;">—— ——{{showauthor}}</h3>
        </div>
    </div>

</div>

</body>

<script>
    var app1 = new Vue({
        el:'#app-1',
        data:{
            showword:'',
            showauthor:'',
            all:''
        },
        mounted(){
            var _this=this;
            $.ajax({
                type:'GET',
                url:'/ht/xitongjson/famouswords.json',
                success:function (data) {
                    app1.all = data;
                    _this.setcontent();
                }
            });
            _this.timer = setInterval(_this.setcontent,2000)
        },

        methods:{
            setcontent(){
                var random = Math.floor(Math.random()*app1.all.length);
                app1.showword = app1.all[random].content;
                app1.showauthor = app1.all[random].author;
            }
        }
    })
</script>


</html>
