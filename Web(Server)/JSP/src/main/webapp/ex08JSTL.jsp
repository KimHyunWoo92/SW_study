<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- taglib 지시자 : 태그라이브러리에서 태그를 가져와 사용하고 싶을 때 사용 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 
	prefix : JSTL 태그를 사용할 때 시작태그 이름 앞에 붙이 접두사
	uri : 태그 라이브러리의 URI 식별자
 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		for (int i=1; i<=10; i++){
			out.print(i);
		}
	
	%>
	<br>
	<%
		for (int i=1; i<=10; i++){ %>
			<%=i %>
		<%}%>
	
	<!-- JSP 문법 -->
	<c:forEach var="i" begin="1" end="10" step="1">
	<!-- EL문법 -->
	<!-- JSTL과 많이 사용하기 때문에 JSTL-EL문법 -->
	<!-- 어떤 구역에 저장만 되어있으면 그냥 불러옴 -->
		${i }
	</c:forEach>
	
	<!-- 1부터 10중에서 짝수만 출력해보기 -->
	<c:forEach var="i" begin="1" end="10" step="1">
		<c:if test="${i%2==0 }">
			${i }
		</c:if>
	</c:forEach>
	<br>
	<!-- 구구단 3단 -->
	
	<c:forEach var="i" begin="1" end="9" step="1">
		3*${i } = ${3*i }<br>
	
	</c:forEach>
	
	
		
</body>
</html>