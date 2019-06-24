<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="v-on" uri="http://www.springframework.org/tags/form" %>
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
    <script src="/ht/vue/vue.js"></script>
    <link rel='stylesheet' href="/ht/bootstrap/css/bootstrap.css">
    <link rel='stylesheet' href="/ht/bootstrap/css//bootstrap-grid.css">
    <link rel='stylesheet' href="/ht/bootstrap/css//bootstrap-reboot.css">


    <style type="text/css">
        .row{
            margin-top: 2%;
            margin-left: 2%;
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
    </style>

</head>
<body>

<div id="success" class="alert alert-success" role="alert">
    还书成功！
</div>

<nav class="navbar navbar-expand-lg navbar-light" style="width: 100%;">
    <a class="navbar-brand" href="/main" style="font-size: 30px;">xx图书馆</a>
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
                <c:choose>
                    <c:when test="${yonghu.id ne null && yonghu.id ne '0'}">
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

<div id="app-5" class="row">
    <div class="col-7">
        <p>欢迎 ${yonghu.name}:</p>
        <h3>已借图书:{{book_number}}</h3>
        <div>

            <div id="have" v-if="showbooks.length === 0" >
                <p>你现在暂时没有借书哦！快来一起读书吧！</p>
                <img src="/ht/xitongpic/mymianbook.jpg">
            </div>

            <div id="no" v-else v-for="book in showbooks" class="text-center" style="margin-right: 10px;float: left;border: rgba(127,129,123,0.73) 2px solid; border-radius: 10px;">
                <div>
                    <img v-bind:src="book.cover" v-bind:alt="book.name的封面" class="img-thumbnail" style="width: 200px;height: 300px;">
                </div>
                <div style="float: left">
                    <p>书名：{{book.name}}</p>
                    <p>作者：{{book.author}}</p>
                    <p>价格：{{book.price}}</p>
                    <p>被借次数：{{book.count}}</p>
                </div>
                <div style="margin-top: 20%;">
                    <img v-on:click="huanshu(book.id)" src="/ht/xitongpic/huan.png" style="width: 40px; height: 40px;" data-toggle="tooltip" data-placement="top" title="还书">
                </div>
            </div>

            <div style="clear: both"></div>

            <div>
                <button v-on:click="b_prePage">上一页</button>
                <span>{{b_nowPage}}</span>
                <button v-on:click="b_nextPage">下一页</button>
                <span>共{{b_totlePage}}页</span>
            </div>


        </div>
    </div>
    <div class="col-5">
        <h3>借阅记录：</h3>

        <div v-if="records.length===0">
            <p>暂时还没有借阅记录哦！</p>
            <hr style="border: rgba(127,129,123,0.73) 2px solid;">
            <p>快开始你的读书之旅吧！</p>
            <img src="/ht/xitongpic/mymainbook2.jpg" style="width: 80%;height: 40%;">
        </div>

        <div v-else>
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
                <tr v-for="(record,index) in showrecords">
                    <th scope="row">{{index+1}}</th>
                    <td>{{record.book.name}}</td>
                    <td>{{record.book.author}}</td>
                    <td>{{record.lend_time}}</td>
                    <td v-if='record.re_time!=="null"'>{{record.re_time}}</td>
                    <td v-else>未归还</td>
                </tr>
                </tbody>
            </table>

            <div>
                <button v-on:click="r_prePage">上一页</button>
                <span>{{r_nowPage}}</span>
                <button v-on:click="r_nextPage">下一页</button>
                <span>共{{r_totlePage}}页</span>
            </div>

        </div>

    </div>
</div>


<script>
    Date.prototype.Format = function (fmt) { //
        var o = {
            "M+": this.getMonth() + 1, //Month
            "d+": this.getDate(), //Day
            "h+": this.getHours(), //Hour
            "m+": this.getMinutes(), //Minute
            "s+": this.getSeconds(), //Second
            "q+": Math.floor((this.getMonth() + 3) / 3), //Season
            "S": this.getMilliseconds() //millesecond
        };
        if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() +

            "").substr(4 - RegExp.$1.length));
        for (var k in o)
            if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1,

                (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        return fmt;
    };
    // item.eventDate.timestamp= new Date(item.eventDate.timestamp).Format("dd/MM/yyyy hh:mm:ss");


    var app5 = new Vue({
        el:'#app-5',
        data:{
            books:${yonghu.books},
            book_number:${yonghu.book_number},
            records:${records},
            b_pageSize:2,
            b_totlePage:0,
            b_nowPage:1,
            r_pageSize:10,
            r_totlePage:0,
            r_nowPage:1
        },
        mounted(){
            var _this = this;
            _this.b_nowPage = 1;
            if(_this.books.length%_this.b_pageSize != 0){
                _this.b_totlePage = parseInt(_this.books.length/_this.b_pageSize)+1;
            }else {
                _this.b_totlePage = parseInt(_this.books.length/_this.b_pageSize);
            };

            _this.r_nowPage=1;
            if(_this.records.length%_this.r_pageSize != 0){
                _this.r_totlePage = parseInt(_this.records.length/_this.r_pageSize)+1;
            }else {
                _this.r_totlePage = parseInt(_this.records.length/_this.r_pageSize);
            };


        },
        computed: {
            showbooks: function () {
                var show_books = [];
                if (this.b_nowPage * this.b_pageSize > this.books.length) {
                    for (var i = (this.b_nowPage - 1) * this.b_pageSize; i < this.books.length; i++) {
                        show_books.push(this.books[i])
                    }
                } else {
                    for (var i = (this.b_nowPage - 1) * this.b_pageSize; i < this.b_nowPage * this.b_pageSize; i++) {
                        show_books.push(this.books[i])
                    }
                }

                return show_books;
            },
            showrecords: function () {
                var show_records = [];
                if (this.r_nowPage * this.r_pageSize > this.records.length) {
                    for (var i = (this.r_nowPage - 1) * this.r_pageSize; i < this.records.length; i++) {
                        show_records.push(this.records[i]);
                    }
                } else {
                    for (var i = (this.r_nowPage - 1) * this.r_pageSize; i < this.r_nowPage * this.r_pageSize; i++) {
                        show_records.push(this.records[i])
                    }
                }
                return show_records;
            }
        },
        methods: {
            b_nextPage: function () {
                if (app5.b_nowPage + 1 > app5.b_totlePage) {
                    alert("最后一页了");
                } else {
                    app5.b_nowPage += 1;
                }
            },
            b_prePage: function () {
                if (app5.b_nowPage - 1 < 1) {
                    alert("前面没有了");
                } else {
                    app5.b_nowPage -= 1;
                }
            },
            r_nextPage: function () {
                if (app5.r_nowPage + 1 > app5.r_totlePage) {
                    alert("最后一页了");
                } else {
                    app5.r_nowPage += 1;
                }
            },
            r_prePage: function () {
                if (app5.r_nowPage - 1 < 1) {
                    alert("前面没有了");
                } else {
                    app5.r_nowPage -= 1;
                }
            },
            refush:function(){
                var _this = this;
                _this.b_nowPage = 1;
                if(_this.books.length%_this.b_pageSize != 0){
                    _this.b_totlePage = parseInt(_this.books.length/_this.b_pageSize)+1;
                }else {
                    _this.b_totlePage = parseInt(_this.books.length/_this.b_pageSize);
                };

                _this.r_nowPage=1;
                if(_this.records.length%_this.r_pageSize != 0){
                    _this.r_totlePage = parseInt(_this.records.length/_this.r_pageSize)+1;
                }else {
                    _this.r_totlePage = parseInt(_this.records.length/_this.r_pageSize);
                };

            },
            huanshu: function (bid) {
                var xinxi={bid:bid};
                // alert(bid)
                $.ajax({
                    type:'GET',
                    url:'huanshu',
                    dataType:'JSON',
                    timeout:20000,
                    data:xinxi,
                    success:function (data) {
                        // alert(data);
                        for (var i=0;i<app5.books.length;i++){
                            if (app5.books[i].id==bid){
                                app5.books.splice(i,1)
                            }
                        }
                        for (var index = 0;index<app5.records.length;index++){
                            if (app5.records[index].id == data.id && app5.records[index].re_time == "null"){
                                app5.records[index].re_time = data.re_time;
                                // app5.records.splice(index,1,data)
                            }
                        }

                        app5.book_number -=1;
                        app5.refush();
                        $('#success').fadeIn();
                        setTimeout(function () {
                            $('#success').fadeOut("slow");
                        },1000);
                    }
                })
            }
        }

    });


</script>
</body>

</html>
