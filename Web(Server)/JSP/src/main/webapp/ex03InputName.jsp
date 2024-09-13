<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="ex03PrintName.jsp" method="post"> <!-- Servlet으로 데이터 보낼 때 : 매핑값 // JSP로 보낼때 : 파일 이름.jsp -->
		
		<input type="text" name="name">
		<input type="submit">
		
	</form>
</body>
</html>