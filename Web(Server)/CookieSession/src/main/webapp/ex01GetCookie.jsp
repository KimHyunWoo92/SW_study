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
	
		// 1. 쿠키꺼내오기
		Cookie[] cookies = request.getCookies();
		
		// 2. name값이 season인 데이터를 꺼내오는 방법
		for (Cookie c : cookies){
			// 3. cookie의 name값 확인하기
			if (c.getName().equals("season")){
				// 4. 내가 비교하고 싶은 값이랑 일치한다면
				out.print("<h1>");
				// 5. cookie의 value값을 꺼내서 출력하기
				out.print(c.getValue());
				out.print("</h1>");
			}
		}
	
	%>
	
</body>
</html>