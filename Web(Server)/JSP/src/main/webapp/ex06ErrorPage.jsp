<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body align="center">

	<img alt="잘못 불러옴" src="./img/error.png" width=400, height=400><br>
	서버 오류를 점검 중입니다.<br>
	<br>
	아래 번호로 문의 주세요!<br>
	Tel : 010 - 0000 - 0000<br>
	
	<%=exception.getMessage()%>
	
</body>
</html>