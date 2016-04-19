<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>登陆界面</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="../../resources/css/login.css" rel="stylesheet" type="text/css"/>

<script type="text/javascript" src="../../resources/js/jquery.min.js"></script>

</head>
<script type="text/javascript">
	var __links = document.querySelectorAll('a');
	function __linkClick(e) {
		parent.window.postMessage(this.href, '*');
	};
	for ( var i = 0, l = __links.length; i < l; i++) {
		if (__links[i].getAttribute('data-t') == '_blank') {
			__links[i].addEventListener('click', __linkClick, false);
		}
	}
</script>
<%--<script--%>
	<%--src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>--%>
<script type="text/javascript">
	$(document).ready(function(c) {
		$('.whit-close').click(function(c) {
			$('.login').fadeOut('slow', function(c) {
				$('.login').remove();
			});
		});
	});
</script>
<script type="text/javascript" src="../../resources/js/jquery.min.js"></script>

<body>
	<!--  
	<h1>Shade login Form</h1>
	-->
	<div class="login">
		<div class="login-top">
			<div class="whit-close">
				<img src="../../resources/images/close.png" alt="">
			</div>
			<h2>Paper Recommender</h2>
		</div>
		<div class="login-bottom">
			<h3>Login</h3>
			<c:if test="${!empty error}">
				<font color="red"><c:out value="${error}" /></font>
			</c:if>
			<form action="<c:url value='/user/loginCheck'/> " method="post">
				<input type="text" name="userName" value="Username" onfocus="this.value = '';"
					onblur="if (this.value == '') {this.value = 'Username';}">
				<input type="password" name="password" value="Password" onfocus="this.value = '';"
					onblur="if (this.value == '') {this.value = 'Password';}">
				<h4>
					<a href="#">Forgot Password?</a>
				</h4>
				<label class="checkbox"><input type="checkbox"
					name="checkbox" checked><i> </i> Stay signed in</label> <input
					type="submit" value="Login Now!" />
			</form>
		</div>
		<p>
			<a target="__blank" href="<c:url value='/user/register'/> ">Create new ID </a>
		</p>
	</div>
	<div class="copyright">
		<p>
			Copyright © 2015. All Rights Reserved by Academic CitNet.Collect from 小蔡 
		</p>
	</div>
</body>
</html>
