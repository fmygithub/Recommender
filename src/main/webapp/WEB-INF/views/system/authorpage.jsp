<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <script type="text/javascript" src="../../../resources/js/d3.v3.js"></script>
    <title>Recommendation System</title>
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="../../../resources/css/style.css" rel="stylesheet" type="text/css" media="all" />
	<style>
			.bar{
		    display: inline-block;
			width: 20px;
			height: 75px;
			margin-right: 2px;
			background-color: teal;
		}
		.node {
/*  stroke: #fff;
  stroke-width: 1.5px;*/
}

.link {
/*  fill: none;
  stroke: #bbb;*/
  fill: none;
/*  stroke: #666;*/
  stroke-width: 0.5px;
}
.nodetext {
	font-size: 18px ;
	font-family: SimSun;
	fill:#000000;
	fill-opacity:0.0;
}
text {
  pointer-events: none;
/*  font: 12px normal;*/
  font:  12px normal "宋体",Arial,Times;
  fill:  block;
}
.background {
  fill: green;
  pointer-events: all;
}
		</style>
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
                    <form id="search-form" method="post" action="searchauthorcit.action" autocomplete="off">
                        <input type="text" value="Author" id="name" name="name" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = 'Search';}">
                        <input type="submit" value="Go" />
                    </form>
                </div>
            </div>
        <div class="clear"></div>
    </div>
</div>
-->
<div class="header">
	<%@include file="./top.jsp"%>
</div>

<div class="wrap">
    <div class="main">
        
        
        	<iframe frameBorder="0" id="main" name="main"
				scrolling="no" src="../system/paperalllist.action" 
				height="135%" width="100%">
				</iframe>
        
   </div>
        
<div class="f-menu">
        <div class="clear"></div>
    <div class="copy">Copyright © 2015. All Rights Reserved by Academic CitNet.Collect from 小蔡 </div>
</div>
</div>
</body>
</html>
