<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body align="center">
	
	<h1>서브페이지</h1>
	<br>
	<br>
	<a href="ex07MainPage.jsp">메인 페이지로 이동</a>
	<br><br>
	<%@ include file="ex07Footer.jsp"%>
	<jsp:include page="ex07Footer.jsp"/>
</body>
</html>