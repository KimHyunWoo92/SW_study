<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	int num = 0;
	for (int i=1; i<101; i++){
		num += i;
	}
	%>
	<%= "1부터 100의 합 : "+num %>
</body>
</html>