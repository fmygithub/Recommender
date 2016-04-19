<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

    <title>Top page</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link href="../../../resources/css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <style type="text/css">
        .hide {
            visibility: hidden;
            empty-cells: hide;
            display: none;
        }

        .p1 {
            color: #b0d40e;

        }

        .q1 {
            color: wheat;
        }

        .show {
            visibility: visible;
        }

        .personCenter {
            width: 200px;
            height: 80px;
            display: none;
            background-color: #f6f7f7;
            color: #333333;
            line-height: 18px;
            border: 1px solid #e1e3e2;
            padding: 5px;
        }
    </style>
    <script type="text/javascript" src="../../../resources/js/jquery.min.js"></script>
    <%--<script type="text/javascript" src="js/jquery.validate.js"></script>--%>
    <script type="text/javascript">
        $(function () {
            //hover某处显示悬浮框
            $("#settings").mouseover(function (e) {
                //获取鼠标位置函数
                var mousePos = mousePosition(e);
                var xOffset = 114;
                var yOffset = 5;
//                alert((mousePos.y) + "----" + (mousePos.x));
                $("#personCenter").css("display", "block").css("position", "absolute")
                        .css("top", "30px").css("left", "1040px");
//                        .css("top", (mousePos.y - yOffset) + "px").css("left", (mousePos.x + xOffset) + "px");

            });
            //鼠标离开表格隐藏悬浮框
            $("#settings").mouseout(function (e) {
                var mousePos = mousePosition(e);
                if (mousePos.x < 800 || mousePos.x > 1130 || mousePos.y > 160 || mousePos.y < 20) {
                    $("#personCenter").css("display", "none");
                }
            });
//            $(document).mousemove(function(e){
//                var mousePos = mousePosition(e);
//                if (mousePos.x < 800 || mousePos.x > 1130 || mousePos.y > 160 || mousePos.y < 20) {
//                    $("#personCenter").css("display", "none");
//                }
//            });

        });

        //获取鼠标坐标
        function mousePosition(ev){
            ev = ev || window.event;
            if(ev.pageX || ev.pageY){
                return {x:ev.pageX, y:ev.pageY};
            }
            return {
                x:ev.clientX + document.body.scrollLeft - document.body.clientLeft,
                y:ev.clientY + document.body.scrollTop - document.body.clientTop
            };
        }

        function paper() {
            var p = document.getElementById("paper");
            p.className = "show";
            var a = document.getElementById("author");
            a.className = "hide";
            var pt = document.getElementById("1");
            pt.className = "p1";
            var au = document.getElementById("2");
            au.className = "q1";
            var t = document.getElementById("title");
            t.focus();

        }

        function author() {
            var a = document.getElementById("author");
            a.className = "show";
            var p = document.getElementById("paper");
            p.className = "hide";
            var pt = document.getElementById("1");
            pt.className = "q1";
            var au = document.getElementById("2");
            au.className = "p1";
            var n = document.getElementById("name");
            n.focus();
        }
        function goLogin() {
            window.location = "/user/login";
        }
        function goRegister() {
            window.location = "/user/register";
        }
        //个人设置
        function mouseOver() {
            var paperCenter = document.getElementById("personCenter");
            paperCenter.style.display="block";
        }
        function mouseLeave() {
            var paperCenter = document.getElementById("personCenter");
            paperCenter.style.display="none";
        }
    </script>

</head>
<body>


<div class="header">
    <div class="wraptop">
        <div class="logo">
            <a href="/">
                <h1><span style="color: white; text-align: center;font-size: 35px">Paper Recommender</span></h1>
                <%--<img src="../../../resources/images/homepage/logo.png" alt="crocodile"/>--%>
            </a></div>
        <div class="headerbox">
            <div class="login">
                <ul>
                    <li><a href="#" onclick="paper();"
                           style="text-decoration: none ; color: #b0d40e"><font
                            id="1">Paper</font></a></li>
                    &nbsp;丨
                    <li><a href="#" onclick="author();" style="text-decoration: none ; color: wheat"><font
                            id="2">Author</font>
                    </a></li>
                </ul>
            </div>
            <div class="search">
                <form id="paper" method="post" action="/paper/searchCit" autocomplete="off" class="show">

                    <input type="text" value="Pepar" name="title" id="title" class="textbox" onFocus="this.value = '';"
                           onBlur="if (this.value == '') {this.value = 'Paper';}"/>
                    <input type="submit" value="Go"/>
                </form>

                <form id="author" method="post" action="/author/fuzzySearchAuthor" autocomplete="off" class="hide">
                    <input type="text" value="Author" name="fuzzyName" id="name" class="textbox" onFocus="this.value = '';"
                           onBlur="if (this.value == '') {this.value = 'Author';}"/>

                    <input type="submit" value="Go"/>

                </form>

            </div>
        </div>
        <div class="loginRegister">
            <c:if test="${sessionScope.user == null}">
                <input type="button" value="登录" onclick="goLogin();"/>&nbsp;|&nbsp;<input type="button" value="注册" onclick="goRegister();"/>
            </c:if>
            <c:if test="${sessionScope.user != null}">
                <span style="color: greenyellow;">欢迎 ${sessionScope.user.userName}</span> &nbsp;
                <img id="settings" width="23px" height="23px"  src="../../../resources/images/settings.png" alt="settings" >
            </c:if>
        </div>
        <div class="clear"></div>
    </div>
</div>
<div id="personCenter" style="display: none; width: 100px; height: 110px; background-color: gainsboro;
    position: absolute; top:30px;left: 1040px" >
    <br/>&nbsp;&nbsp;
    <a href="/personCenter" style="color: #333">个人中心</a>
    <br/>
    <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="/user/login" style="color: #333">注销</a>
</div>

</body>
</html>
