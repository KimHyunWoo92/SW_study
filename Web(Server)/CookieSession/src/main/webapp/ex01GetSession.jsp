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
		// HttpSession session = request.getSession();	
		// ** jsp에서는 session이 내장객체
		String s = (String) session.getAttribute("data");
	
	%>
	<h1><%=s %> </h1>

</body>
</html>