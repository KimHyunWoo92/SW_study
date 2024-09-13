<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 화면에 쿠키몬스터님 환영합니다를 p태그를 통해 출력  -->
	<%
		String s = (String) session.getAttribute("nick");
	%>
	<p><%=s %>님 환영합니다!</p> <a href="LoginForm.jsp">로그아웃</a>
	
</body>
</html>