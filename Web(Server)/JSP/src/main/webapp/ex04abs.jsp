<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!
		// abs 메소드 만들기
		public int abs (int num){
			if (num <0 ){
				return -num;
			}return num;
		}
	%>
	
	5의 절대값 : <%=abs(5) %><br>
	-5의 절대값 : <%=abs(-5) %>
</body>
</html>