<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>Recommendation System</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link href="../../../resources/css/style.css" rel="stylesheet" type="text/css" media="all"/>
</head>

</head>

<body>
<div class="wrap">
    <div class="main">

        <div class="content">
            <c:forEach items="${paperList}" var="paper" step="1" varStatus="p">
                <article>
                    <h2>
                        <a target="__blank" href="/paper/searchCit?title=${paper.title}">${paper.title}</a>
                        &nbsp;&nbsp;${paper.year}
                    </h2>
                    <h4>${paper.author}</h4>
                    <h4>${paper.publish}</h4> <!--  发表地址-->
                </article>
            </c:forEach>

            <table>
                <tr>
                    <td height="35">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td width="25%" height="29" nowrap="nowrap">
                                    <table width="320" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td width="44%" class="STYLE1">当前页：${pageNow}/${pageCount}页
                                            </td>
                                        </tr>
                                    </table>
                                </td>

                                <td width="75%" valign="top" class="STYLE1">
                                    <div align="right">
                                        <table width="230" height="20" border="0" cellpadding="0"
                                               cellspacing="0">
                                            <tr>
                                                <td width="50" height="22" valign="middle">
                                                    <div align="right">
                                                        <c:if test="${pageNow == 1}">
                                                            <img src="../../../resources/images/page_back_1.gif"
                                                                 width="50"
                                                                 height="20"/>
                                                        </c:if>
                                                        <c:if test="${pageNow != 1}">
                                                            <a href="<c:url value='/paper/papers/${pageNow - 1}'/>"
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
                                                            <a href="/paper/papers/${pageNow + 1}"
                                                               onclick="canClienk()" id="next"> <img
                                                                    src="../../../resources/images/page_next.gif"
                                                                    width="50" height="20"/>
                                                            </a>
                                                        </c:if>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <div class="sidebar">
            <div class="recent">
                <h3><a target="_blank" href="/author/allAuthors">Author</a></h3>
                <ul>
                    <c:forEach items="${authorList}" var="author">
                        <%--使得快捷方式可以通过连接过去--%>
                        <li><a target="__blank" href="/author/searchAuthorCit?name=${author.name}">${author.name}</a>
                        </li>
                    </c:forEach>
                </ul>
                <h3>Unit</h3>
                <ul>
                    <c:forEach items="${unitList}" var="unit">
                        <li><a href="#">${unit.unit}</a></li>
                    </c:forEach>
                </ul>
            </div>
            <div class="add">
                <a href="#"><img src="../../../resources/images/homepage/add2.jpg" align="300x250"/></a>
                <table width="80%">
                    <tr>
                        <td align="right">

                        </td>
                        <td align="center">

                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="clear"></div>
    </div>


</div>
</div>


</body>
</html>
