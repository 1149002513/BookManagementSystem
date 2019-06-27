<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: sunqi
  Date: 19-6-17
  Time: 上午11:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>申请成功</title>

    <script src="/ht/jquery/jquery-3.3.1.js"></script>
    <script src="/ht/bootstrap/js/bootstrap.js"></script>
    <link rel='stylesheet' href="/ht/bootstrap/css/bootstrap.css">
    <link rel='stylesheet' href="/ht/bootstrap/css//bootstrap-grid.css">
    <link rel='stylesheet' href="/ht/bootstrap/css//bootstrap-reboot.css">



    <style type="text/css">

        @keyframes bj {
            0%{

                background-image: url("/ht/xitongpic/rs1.jpg");
            }

            25%{
                background-image: url("/ht/xitongpic/rs2.jpg");
            }

            50%{
                background-image: url("/ht/xitongpic/rs3.jpg");
            }

            75%{
                background-image: url("/ht/xitongpic/rs4.jpg");
            }

            100%{
                background-image: url("/ht/xitongpic/rs1.jpg");
            }
        }

        body{
            /*首次先将所有图片下载下来，这样在第一次循环图片时就不会有短暂白屏出现，背景会被最后一个设置的背景替换*/
            background: url("/ht/xitongpic/rs4.jpg");
            background: url("/ht/xitongpic/rs3.jpg");
            background: url("/ht/xitongpic/rs2.jpg");
            background: url("/ht/xitongpic/rs1.jpg");
            background-size: 100% 100%;
            -webkit-animation: bj 20s ease-out;
            -moz-animation: bj 20s ease-out;
            animation: bj 20s ease-out;
            -webkit-animation-iteration-count: infinite;
            -moz-animation-iteration-count: infinite;
            animation-iteration-count: infinite;
        }
        .container {
            width: 100%;
            height: 90%;
            margin-top: 2%;
        }
        .row{
            width: 100%;
            height: 90%;
        }
    </style>

</head>
<body id="body">

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

<nav class="navbar navbar-expand-lg navbar-light" style="width: 100%;">
    <a class="navbar-brand" href="#" style="font-size: 30px; color: #fdfff9">xx图书馆</a>
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
                <a class="nav-link" href="#" style="color: #ffffff;font-size: 15px;" data-toggle="modal" data-target="#myModal">我的图书馆</a>
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

<div class="container">
    <div class="row">
        <div class="col-2">
        </div>
        <div class="col-8">
            <center>
                <div>
                    <h1 style="color: #fdfff9">恭喜，申请成功，请耐心等候管理员审核</h1>
                </div>
            </center>
            <div style="width: 100%;">
                <p style="margin-top:10%;float: right; color: #fdfff9;font-size: 20px;">读书就像一场修行，你所看过的书都将成为你的一部分。</p>
            </div>

            <br>
            <div style="margin-top:20%;">
                <a href="/main" style="color: #fdfff9;font-size: 20px;">返回首页，看看你喜欢哪些书吧。</a>
            </div>
        </div>
        <div class="col-2">
        </div>
    </div>
</div>



</body>
</html>
