<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>个人中心</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link href="../../../resources/css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="../../../resources/css/index2.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="../../../resources/js/jquery.min.js"></script>

    <script type="text/javascript">
        <c:if test="${sessionScope.user == null}">
        alert("您还没有登录呦！");
        window.location = "javascript:history.go(-1);";
        </c:if>

        function showCollect() {
            document.getElementById("main").setAttribute("src", "/favorites/getAllFavorites");
        }
        function showAttention() {
            document.getElementById("main").setAttribute("src", "/attention/getAllAttentions");
        }
    </script>
</head>
<body>
<div class="header">
    <%@include file="system/top.jsp" %>
</div>
<div class="wrap">
    <div class="main" style="height: 600px">
        <div class="clear"></div>
        <div class="contentUser">
            <table border="0">
                <tr style="width: 96px">
                    <td valign="top" colspan="1">
                        <c:if test="${sessionScope.user != null}">
                            <div style="float:left;font-weight:bold;"
                                 class="event_detail_title td_word_wrap_455">${sessionScope.user.userName}
                            </div>
                        </c:if>
                        <div style="float:right; margin-top:6px;">

                        </div>
                    </td>
                </tr>
                <tr>
                    <td width="96px" height="96px" valign="top" style="padding-top: 5px">
                        <img src="../../../resources/images/no.jpg" width="160" height="160" class="my_img">
                        <br/> &nbsp;
                        <a href="#" onclick="showCollect();">收藏 ${collectCount}</a>
                        &nbsp;
                        <a href="#" onclick="showAttention();">关注了 ${attentionCount}人</a>
                    </td>
                </tr>
            </table>

        </div>
        <div id="attentionList" class="sidebar" style="width: 560px; height: 250px">

            <iframe frameBorder="0" id="main" name="main"
                    scrolling="no" src="/favorites/getAllFavorites"
                    height="250%" width="100%">
            </iframe>
        </div>


        <%--<div id="attentionList" class="sidebar" style="width: 560px;">--%>
            <%--<div class="recent">--%>
                <%--<h3>My Attentions</h3>--%>
                <%--<ul>--%>
                    <%--<c:forEach items="${paperList}" var="paper" step="1" varStatus="p">--%>
                        <%--<article>--%>
                            <%--<li>--%>
                                <%--<a target="__blank" href="/paper/searchCit?title=${paper.title}">${paper.title}</a>--%>
                                <%--&nbsp;&nbsp;${paper.year}--%>
                            <%--</li>--%>
                        <%--</article>--%>
                    <%--</c:forEach>--%>
                <%--</ul>--%>
            <%--</div>--%>
        <%--</div>--%>
        <div class="clear"></div>
    </div>
    <div class="f-menu" style="position:fixed;bottom:0;left: 20%; right:20% ; text-align: center; ">
        <div class="clear"></div>
        <div class="copy">Copyright © 2015. All Rights Reserved by Academic CitNet.Collect from 小蔡</div>
    </div>
</div>
</body>
</html>
