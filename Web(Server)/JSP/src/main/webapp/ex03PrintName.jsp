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
		request.setCharacterEncoding("UTF-8"); //post방식 인코딩
		String name = request.getParameter("name");
	%>
	
	입력한 이름 : <%=name%>
	
</body>
</html>