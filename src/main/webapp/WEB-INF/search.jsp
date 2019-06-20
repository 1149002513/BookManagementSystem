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
            border: rgba(127,129,123,0.73) 2px solid;
            border-radius: 7px;
            margin-top: 2%;
            width: 98%;
            margin-left: 1%;
        }

        .book{
            float: left;
            margin-left: 2%;
            margin-top: 1%;
            border: rgba(216,221,216,0.73) 1px dotted;
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

    <div id="books" class="bookcontent" style="height: auto;">
        <div v-for="book in showbooks" class="book">
            <div>
                <img v-bind:src="book.cover" v-bind:alt="book.name的封面" class="img-thumbnail" style="width: 200px;height: 300px;">
            </div>
            <div style="float: left">
                <p>书名：{{book.name}}</p>
                <p>作者：{{book.author}}</p>
                <p>价格：{{book.price}}</p>
                <p>被借次数：{{book.count}}</p>
            </div>

            <div v-if="book.uid === '0'" style="margin-left: 30px;">
                <img src="/ht/xitongpic/book.png" style="width: 50px; height: 50px;margin-left:30%;margin-top:30%;" data-toggle="tooltip" data-placement="top" title="预约借书">
            </div>

            <div v-else style="margin-left: 30px;">
                <img src="/ht/xitongpic/book2.png" style="width: 50px; height: 50px;margin-left:30%;margin-top:30%;" data-toggle="tooltip" data-placement="top" title="已借出">
            </div>
        </div>

        <div style="clear: both"></div>

    </div>

    <div style="width: 100%;height: 2%;"></div>

   <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups" style="margin-left: 40%;">
       <div class="btn-group mr-2" role="group" aria-label="First group">
           <button type="button" class="btn btn-secondary">1</button>
           <button type="button" class="btn btn-secondary">2</button>
           <button type="button" class="btn btn-secondary">3</button>
           <button type="button" class="btn btn-secondary">4</button>
       </div>
   </div>

</div>

</body>

<script>
    var bookcontent = new Vue({
        el:'#books',
        data:{
            books:${books},
            pageSize:3,
            totlePage:0,
            nowPage:1
        },
        mounted(){
            var _this = this;
            _this.nowPage = 1;
            if(_this.books.length%_this.pageSize != 0){
                _this.totlePage = parseInt(_this.books.length/_this.pageSize)+1;
            }else {
                _this.totlePage = parseInt(_this.books.length/_this.pageSize)
            }

        },
        computed:{
            showbooks:function () {
                var show_books = [];
                if (this.nowPage*this.pageSize > this.totlePage){
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
                if (app3.nowPage+1 > app3.totlePage){
                    alert("最后一页了");
                } else {
                    app3.nowPage += 1;
                }
            },
            prePage:function () {
                if (app3.nowPage-1<1){
                    alert("前面没有了");
                } else {
                    app3.nowPage -= 1;
                }
            },
            
            searchnew:function () {
                var search = {search:$('#search').val()};
                $.ajax({
                    type:'GET',
                    url:'search2',
                    dataType:'JSON',
                    timeout:20000,
                    data: search,
                    success:function (data) {
                        this.books=data;
                    }
                })
            }
        }
    })
</script>
</html>
