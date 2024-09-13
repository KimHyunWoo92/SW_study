<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 첫번째 방법 스크립 클릿을 끊어서 사용하기 -->
	<table border=1>
		<tr>
			<%for (int i=1; i<=10; i++){ %>
				<td><%=i%></td>
			<%}%>
			
		</tr>
	</table>
	
	<!-- 두번째 방법 : 스크립틀릿 끊지 않고 사용-->
	<table border=1>
		<tr>
			<%
				for (int i=1; i<=10; i++){
					out.print("<td>"+i+"</td>");
				}
			%>
		</tr>
	</table>
</body>
</html>