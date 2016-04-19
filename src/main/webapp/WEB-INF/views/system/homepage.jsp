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
<!--
<div class="header">
  <div class="wrap">
          <div class="logo"><a href="#"><img src="../images/homepage/logo.png" alt="crocodile" /></a></div>
          <div class="headerbox">
          <div class="login">
                  <ul>
                      <li><a href="./homepage.jsp">Paper</a></li> |
                      <li><a href="./authorpage.jsp">Author</a></li>
                  </ul>
              </div>
              <div class="search">
                  <form id="search-form" method="post" action="searchcit.action" autocomplete="off">
                      <input type="text" value="Pepar" id="title" name="title" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = 'Search';}">
                      <input type="submit" value="Go" />
                  </form>
              </div>
          </div>
      <div class="clear"></div>
  </div>
</div>
-->
<div class="header">
    <%@include file="./top.jsp" %>
</div>
<div class="wrap">
    <div class="main">


        <iframe frameBorder="0" id="main" name="main"
                scrolling="no" src="<c:url value='/paper/papers/1'/>"
                height="250%" width="100%">
        </iframe>


    </div>
    <div class="f-menu" style="position:fixed;bottom:0;left: 20%; right:20% ; text-align: center; ">
        <div class="clear"></div>
        <div class="copy">Copyright © 2015. All Rights Reserved by Academic CitNet.Collect from 小蔡</div>
    </div>
</div>
</body>
</html>
