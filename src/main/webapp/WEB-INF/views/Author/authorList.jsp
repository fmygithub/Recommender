<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>Author List</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link href="../../../resources/css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="../../../resources/css/index2.css" rel="stylesheet" type="text/css"/>

    <script type="text/javascript">
        <c:if test="${authorList == null || authorList.size() == 0}">
        alert("查询无果");
        window.location = "javascript:history.go(-1);";
        </c:if>
    </script>
</head>

<body>

<div class="header">
    <%@include file="../system/top.jsp" %>
</div>
<div class="wrap">
    <div class="main">
        <div class="contentAuthor">
            <h1>Authors</h1>
            <hr/>
            <table>
                <tr>
                    <c:forEach items="${allFirstLetter}" var="fl">
                        <c:choose>
                            <c:when test="${fl == curFirstLetter}">
                                <td>
                                    <a href="/author/allAuthors?firstLetter=${fl}">
                                        <button style="color: red">${fl}</button>
                                    </a>&nbsp;
                                </td>
                            </c:when>
                            <c:otherwise>
                                <td>
                                    <a href="/author/allAuthors?firstLetter=${fl}">
                                        <button>${fl}</button>
                                    </a>&nbsp;
                                </td>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </tr>
            </table>

            <table border="0" width="80%" style="margin-left: 10%; margin-right: 10%">
                <tbody>
                <c:forEach items="${authorList}" var="author" step="1" varStatus="p">
                    <tr>
                        <td width="96px" height="96" valign="top" style="padding-top: 5px">
                            <img src="../../../resources/images/no.jpg" width="96" height="96" class="my_img">
                        </td>
                        <td class="author_info">
                            <h2>
                                <a target="__blank"
                                   href="/author/searchAuthorCit?name=${author.name}">${author.name}
                                    &nbsp;&nbsp;
                                    <c:if test="${author.othername != null && author.othername.length() > 0}">
                                        (${author.othername})
                                    </c:if>
                                </a>
                            </h2>
                            <br/>
                            <h4>机&nbsp;&nbsp;构：&nbsp;&nbsp;${author.unit}</h4>
                            <h4>领&nbsp;&nbsp;域：&nbsp;&nbsp;${author.fields}</h4>

                            <p></p>
                        </td>
                    </tr>
                    <tr>
                        <td><br/></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <br/>
            <c:if test="${pageCount > 1}">
                <table border="0" width="40%" style="margin-left: 30%; margin-right: 30%; margin-bottom: 60px">
                    <tr>
                        <td width="44%" class="STYLE1">当前页：${pageNow}/${pageCount}页
                        </td>
                        <td width="50" height="22" valign="middle">
                            <div align="right">
                                <c:if test="${pageNow == 1}">
                                    <img src="../../../resources/images/page_back_1.gif"
                                         width="50"
                                         height="20"/>
                                </c:if>
                                <c:if test="${pageNow != 1}">
                                    <a href="<c:url value='/author/allAuthors?pageNow=${pageNow - 1}&firstLetter=${curFirstLetter}'/>"
                                       onclick="canClienk()" id="forward"> <img
                                            src="../../../resources/images/page_back.gif"
                                            width="50" height="20"/>
                                    </a>
                                </c:if>
                            </div>
                        </td>
                        <td width="54" height="22" valign="middle">
                            <div align="right">
                                <c:if test="${pageNow == pageCount}">
                                    <img src="../../../resources/images/page_next_1.gif"
                                         width="50"
                                         height="20"/>
                                </c:if>
                                <c:if test="${pageNow != pageCount}">
                                    <a href="/author/allAuthors?pageNow=${pageNow + 1}&firstLetter=${curFirstLetter}"
                                       onclick="canClienk()" id="next"> <img
                                            src="../../../resources/images/page_next.gif"
                                            width="50" height="20"/>
                                    </a>
                                </c:if>
                            </div>
                        </td>

                    </tr>
                </table>
            </c:if>

        </div>
    </div>
    <div class="clear"></div>
</div>
<div class="f-menu" style="position:fixed;bottom:0;left: 20%; right:20% ; text-align: center; ">
    <div class="clear"></div>
    <div class="copy">Copyright © 2015. All Rights Reserved by Academic CitNet.Collect from 小蔡</div>
</div>

</body>
</html>
