<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: sunqi
  Date: 19-6-17
  Time: 上午11:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我的图书馆</title>
    <script src="/ht/jquery/jquery-3.3.1.js"></script>
    <script src="/ht/bootstrap/js/bootstrap.js"></script>
    <link rel='stylesheet' href="/ht/bootstrap/css/bootstrap.css">
    <link rel='stylesheet' href="/ht/bootstrap/css//bootstrap-grid.css">
    <link rel='stylesheet' href="/ht/bootstrap/css//bootstrap-reboot.css">

    <style type="text/css">
        .row{
            margin-top: 2%;
            margin-left: 2%;
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
                <a class="nav-link" href="search" style="font-size: 15px;">馆藏书籍</a>
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

<div class="row">
    <div class="col-7">
        <p>欢迎 ${yonghu.name}:</p>
        <h3>已借图书:${yonghu.book_number}</h3>
        <div id="app-2">

            <c:choose>
                <c:when test="${ !empty yonghu.books}">
                    <c:forEach items="${yonghu.books}" var="book">
                        <div class="text-center" style="margin-right: 10px;float: left;border: rgba(127,129,123,0.73) 2px solid; border-radius: 10px;">
                            <img src="${book.cover}" alt="${book.name}的封面" class="img-thumbnail" style="width: 200px;height: 300px;">
                            <p>书名：${book.name}</p>
                            <p>作者：${book.author}</p>
                            <p>价格：${book.price}</p>
                            <p>被借次数：${book.count}</p>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <p>你现在暂时没有借书哦！快来一起读书吧！</p>
                    <img src="/ht/xitongpic/mymianbook.jpg">
                </c:otherwise>
            </c:choose>

        </div>
    </div>
    <div class="col-5">
        <h3>借阅记录：</h3>

        <c:choose>
            <c:when test="${ !empty records}">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th scope="col">序号</th>
                        <th scope="col">书名</th>
                        <th scope="col">作者</th>
                        <th scope="col">借书日期</th>
                        <th scope="col">还书日期</th>
                    </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${records}" var="record" varStatus="i">
                            <tr>
                                <th scope="row">${i.index}</th>
                                <td>${record.book.name}</td>
                                <td>${record.book.author}</td>
                                <td>${record.lend_time}</td>
                                <c:choose>
                                    <c:when test="${!empty record.re_time}">
                                        <td>${record.re_time}</td>
                                    </c:when>
                                    <c:otherwise>
                                        <td>未归还</td>
                                    </c:otherwise>
                                </c:choose>
                            </tr>
                        </c:forEach>

                    </tbody>
                </table>
            </c:when>

            <c:otherwise>
                <p>暂时还没有借阅记录哦！</p>
                <hr style="border: rgba(127,129,123,0.73) 2px solid;">
                <p>快开始你的读书之旅吧！</p>
                <img src="/ht/xitongpic/mymainbook2.jpg" style="width: 80%;height: 40%;">

            </c:otherwise>
        </c:choose>

    </div>
</div>



</body>

</html>
