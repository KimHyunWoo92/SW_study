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
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String[] fruits = request.getParameterValues("checkbox");
	%>
	<fieldset>
		<legend>선호도 조사 시스템</legend>
		<table border='1'>
			<tr>
			<td align="center">이름</td>
			<td><%=name %></td>			
			</tr>
			<tr>
			<td>좋아하는 과일</td>
			<td>
			<% for (int i; i=0; i++) {
				out.print()
			}%>
			
			</td>
			</tr>
		</table>
	</fieldset>
</body>
</html>