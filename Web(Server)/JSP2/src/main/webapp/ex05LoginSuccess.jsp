<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body align="center">
	
	<%
		// String id = request.getParameter("id");
		String id = (String)request.getAttribute("id");
	%>	
	
	<fieldset style="border:dotted;">
		<b><%=id %>님 환영합니다~</b><br>
		<a href="ex05Login.html">로그아웃</a>
	</fieldset>
</body>
</html>