<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
	<head>
		<title>登录</title>
	</head>
	
	<body>
	<h3>用户登录</h3>
	${sessionScope.SPRING_SECURITY_LAST_EXCEPTION.message}
	<form action="${pageContext.request.contextPath}/j_spring_security_check" method="post">
		用户名:<input type="text" name="j_username" /><br>
		密    码:<input type="password" name="j_password" /><br>
		
		<input type="submit" value="登录">
	</form>
	</body>
</html>