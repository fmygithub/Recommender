<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%--<%@page import="com.opensymphony.xwork2.ActionContext" %>--%>
<%--<%@taglib uri="/struts-tags" prefix="s" %>--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>Favorites</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link href="../../../resources/css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <script type="text/javascript" src="../../../resources/js/d3.v3.min.js"></script>

    <script type="text/javascript">

    </script>
</head>
<body>

<div id="collectList" style="width: 560px; height: 1000px">
    <div class="recent">
        <h3>My Collection</h3>
        <ul>
            <c:forEach items="${paperList}" var="paper" step="1" varStatus="p">
                <article>
                    <li>
                        <a target="__blank" href="/paper/searchCit?title=${paper.title}">${paper.title}</a>
                        &nbsp;&nbsp;${paper.year}
                    </li>
                </article>
            </c:forEach>
        </ul>
    </div>
    <c:if test="${pageCount > 1}">
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
                                                        <a href="<c:url value='/favorites/getAllFavorites?pageNow=${pageNow - 1}'/>"
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
                                                        <a href="/favorites/getAllFavorites?pageNow=${pageNow + 1}"
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
    </c:if>
</div>
</body>
</html>
