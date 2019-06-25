<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
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

    <link rel="stylesheet" href="/ht/page/paging.css">


    <style type="text/css">
        .bookcontent{
            border: rgba(127,129,123,0.73) 2px solid;
            border-radius: 7px;
            margin-top: 2%;
            width: 98%;
            margin-left: 1%;
        }

        .book{
            float: left;
            margin-left: 4%;
            margin-top: 1%;
            border: rgba(216,221,216,0.73) 1px dotted;
            border-radius: 10px;
            width: 15%;
        }
        #warn{
            display: none;
            position: absolute;
            left: 30%;
            top: 40%;
            width: 200px;
            height: 50px;
            text-align: center;
        }
        #success{
            display: none;
            position: absolute;
            left: 30%;
            top: 40%;
            width: 200px;
            height: 50px;
            text-align: center;
        }
        #titp{
            display: none;
            position: absolute;
            left: 30%;
            top: 40%;
            width: 200px;
            height: 50px;
            text-align: center;
        }
        #false ,#nextwarn ,#prewarn{
            display: none;
            position: absolute;
            left: 30%;
            top: 40%;
            width: 200px;
            height: 50px;
            text-align: center;
        }
    </style>

</head>
<body>

<div id="success" class="alert alert-success" role="alert">
    预约成功！
</div>

<div id="warn" class="alert alert-warning alert-dismissible fade show" role="alert">
    <strong>请先登录！</strong>
</div>

<div id="nextwarn" class="alert alert-warning alert-dismissible fade show" role="alert">
    <strong>最后一页了！</strong>
</div>

<div id="prewarn" class="alert alert-warning alert-dismissible fade show" role="alert">
    <strong>前面没有了！</strong>
</div>

<div id="titp" class="alert alert-warning alert-dismissible fade show" role="alert">
    <strong>最多只能借5本哦！</strong>
</div>

<div id="false" class="alert alert-success" role="alert">
    预约失败!可能有书超时未还或者借书权限被关闭！
</div>


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
                    <form:form modelAttribute="yonghu" action="logining">
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

<nav class="navbar navbar-expand-lg navbar-light" style="width: 100%;">
    <a class="navbar-brand" href="/main" style="font-size: 30px;">xx图书馆</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent" style="margin-left: 40%;">
        <ul class="navbar-nav mr-auto" >
            <li class="nav-item active" style="margin-right: 10px;">
                <a class="nav-link" href="search" style="font-size: 15px;">馆藏书籍</a>
            </li>
            <li class="nav-item" style="margin-right: 10px;">
                <a class="nav-link" href="#" style="font-size: 15px;">好书推荐</a>
            </li>
            <li class="nav-item" style="margin-right: 10px;">
                <c:choose>
                    <c:when test="${yonghu.id ne '0' && yonghu.id ne null}">
                        <a href="mymain"><img src="${yonghu.avatar}" alt="${yonghu.name}的头像" style="width: 60px;height: 60px;border-radius: 100%;margin-top: -10px;"></a>
                    </c:when>
                    <c:otherwise>
                        <a class="nav-link" href="#" style="font-size: 15px;" data-toggle="modal" data-target="#myModal">我的图书馆</a>
                    </c:otherwise>
                </c:choose>
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
            <button type="submit" class="btn btn-primary" style="height: 4%;width: 6%;margin-left: 2%;" onclick="searchnew();">搜索</button>
        </div>

    <div id="books"  class="bookcontent" style="height: auto;text-align: center;">
        <div v-for="book in showbooks" class="book">
            <div>
                <img v-bind:src="book.cover" v-bind:alt="book.name的封面" class="img-thumbnail" style="width: 200px;height: 300px;">
            </div>
            <div style="float: left;">
                <p>书名：{{book.name}}</p>
                <p>作者：{{book.author}}</p>
                <p>价格：{{book.price}}</p>
                <p>被借次数：{{book.count}}</p>
                <p>所在位置:{{book.location}}</p>
            </div>

            <div v-if="book.uid === '0'" style="margin-right: 10px; float: right;">
                <img src="/ht/xitongpic/book.png"  v-on:click="yuyue(book.id)"  style="width: 50px; height: 50px;margin-left:30%;margin-top:30%;" data-toggle="tooltip" data-placement="top" title="预约借书">
            </div>

            <div v-else style="margin-right: 10px; float: right;">
                <img src="/ht/xitongpic/book2.png" style="width: 50px; height: 50px;margin-left:30%;margin-top:30%;" data-toggle="tooltip" data-placement="top" title="已借出">
            </div>
        </div>

        <div style="clear: both"></div>

    </div>

    <div style="width: 100%;height: 2%;"></div>
    <div class="pagger-box pagger" id="box" style="margin-left: 25%;"></div>
    <script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
    <script src="/ht/page/paging.js"></script>



</div>

</body>

<script>
    var bookcontent = new Vue({
        el:'#books',
        data:{
            books:${books},
            pageSize:5,
            totlePage:0,
            nowPage:1
        },
        mounted(){
            var _this = this;
            _this.nowPage = 1;
            if(_this.books.length%_this.pageSize != 0){
                _this.totlePage = parseInt(_this.books.length/_this.pageSize)+1;
            }else {
                _this.totlePage = parseInt(_this.books.length/_this.pageSize);
            };

        },
        computed:{
            showbooks:function () {
                var show_books = [];
                if (this.nowPage*this.pageSize > this.books.length){
                    for (var i = (this.nowPage-1)* this.pageSize;i<this.books.length;i++){
                        show_books.push(this.books[i])
                    }
                }else {
                    for (var i = (this.nowPage-1)*this.pageSize;i<this.nowPage*this.pageSize;i++){
                        show_books.push(this.books[i])
                    }
                }

                return show_books;
            }
        },

        methods:{
            nextPage:function () {
                if (bookcontent.nowPage+1 > bookcontent.totlePage){
                    $('#nextwarn').fadeIn();
                    setTimeout(function () {
                        $('#nextwarn').fadeOut("slow");
                    },1000);
                } else {
                    bookcontent.nowPage += 1;
                }
            },
            prePage:function () {
                if (bookcontent.nowPage-1<1){
                    $('#prewarn').fadeIn();
                    setTimeout(function () {
                        $('#prewarn').fadeOut("slow");
                    },1000);
                } else {
                    bookcontent.nowPage -= 1;
                }
            },
            refush:function () {
                var _this = this;
                _this.nowPage = 1;
                if(_this.books.length%_this.pageSize != 0){
                    _this.totlePage = parseInt(_this.books.length/_this.pageSize)+1;
                }else {
                    _this.totlePage = parseInt(_this.books.length/_this.pageSize);
                };
                page();
            },
            yuyue:function (data) {
                // console.log(data);
                if (${yonghu.book_number + 1 >5}){
                    $('#titp').fadeIn('slow');
                    setTimeout(function () {
                        $('#titp').fadeOut("slow");
                    },1000);
                }else {
                    if (${yonghu.id=='0'}){
                        $('#warn').fadeIn("slow");
                        setTimeout(function () {
                            $('#warn').fadeOut("slow");
                        },1000);
                    }else {
                        var y = {bid:data,uid:"${yonghu.id}"};
                        $.ajax({
                            type:"GET",
                            url: "yuyue",
                            dataType: "JSON",
                            timeout: 20000,
                            data:y,
                            success:function (data) {
                                if (data){
                                    for (var i=0;i<bookcontent.books.length;i++){
                                        // console.log(bookcontent.books[i])
                                        if (bookcontent.books[i].id==y.bid){
                                            bookcontent.books[i].uid='${yonghu.id}';
                                            bookcontent.books[i].count += 1;
                                        }
                                    }
                                    $('#success').fadeIn();
                                    setTimeout(function () {
                                        $('#success').fadeOut("slow");
                                    },1000);
                                } else {
                                    $('#false').fadeIn();
                                    setTimeout(function () {
                                        $('#false').fadeOut("slow");
                                    },1000);
                                }

                            }
                        });

                    }
                }
            }
        }
    })
</script>

<script>

    function page() {
        var setTotalCount = bookcontent.books.length;
        $('#box').paging({
            initPageNo: 1, // 初始页码
            totalPages: bookcontent.totlePage, //总页数
            totalCount: '合计' + setTotalCount + '条数据', // 条目总数
            slideSpeed: 600, // 缓动速度。单位毫秒
            jump: true, //是否支持跳转
            callback: function(page) { // 回调函数
                console.log(page);
            }
        });
    }

    page();

    function searchnew() {
        var search = {search:$('#search1').val()};
        console.log(search);
        $.ajax({
            type:'GET',
            url:'search2',
            dataType:'JSON',
            timeout:20000,
            data: search,
            success:function (data) {
                // console.log("搜索");
                // console.log(data);
                bookcontent.books=data;
                bookcontent.refush();
            }
        })
    };

</script>
</html>
