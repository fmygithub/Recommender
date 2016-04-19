<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>注册页面</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="../../resources/css/login.css" rel="stylesheet" type="text/css"/>

<script src="../../resources/js/jquery.min.js"></script>
<script src="../../resources/js/register.js"></script>

</head>
<script>
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
<script>
	$(document).ready(function(c) {
		$('.whit-close').click(function(c) {
			$('.login').fadeOut('slow', function(c) {
				$('.login').remove();
			});
		});
	});
</script>
<script src="../../resources/js/jquery.min.js"></script>

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
			<h3>Register</h3>
			<c:if test="${!empty error}">
				<font color="red"><c:out value="${error}" /></font>
			</c:if>
			<form onsubmit="return validate()" action="<c:url value='/user/registerCheck'/>" method="post">
				<span id="emailInfo" style="color: red"></span>
				<input type="text" id = "email" name = "userName" onblur="valiEmail()" value="Username" onfocus="this.value = '';" />
				<span id="pwInfo" style="color: red"></span>
				<input type="password" id = "pw" name = "password" onblur="valiPw()" value="password" onfocus="this.value = '';">
				<%--<span id="repwInfo" style="color: red"></span>--%>
				<%--<input type="password" id = "repw" onblur="valiRepw()">--%>
				<input type="submit" value="Submit" />
			</form>
		</div>
	</div>
	<div class="copyright">
		<p>
			Copyright © 2015. All Rights Reserved by Academic CitNet.Collect from 小蔡 
		</p>
	</div>
</body>
</html>
