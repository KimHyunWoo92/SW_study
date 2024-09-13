<%@page import="java.util.Random"%>
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
	
		String topic = request.getParameter("topic");
		
		String[] random = request.getParameterValues("random");
		
		// System.out.print(random);
		Random rd = new Random();
		String result = random[rd.nextInt(random.length)];
		
	%>
	<fieldset>
		<legend>랜덤당첨결과</legend>
		<%=topic %><br>
		<%=result %>
	</fieldset>
</body>
</html>