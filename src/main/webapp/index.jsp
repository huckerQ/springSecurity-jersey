<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<html>
	<head>
		<title>这是首页</title>
	</head>
	<body>
	这是首页，欢迎<security:authentication property="name"/><br>
	<a href="admin.jsp">管理员界面 </a><br>
	<a href="user.jsp">用户界面 </a><br>
	<form action="${pageContext.request.contextPath}/ws/hello/user" method="post">
		name:<input type="text" name="name" /><br>
		<input type="submit" value="sayHelloFromUser">
	</form><br>
	<form action="${pageContext.request.contextPath}/ws/hello/admin" method="post">
		name:<input type="text" name="name" /><br>
		<input type="submit" value="sayHelloFromAdmin">
	</form><br>
	<a href="j_spring_security_logout">登出</a>
	</body>
</html>