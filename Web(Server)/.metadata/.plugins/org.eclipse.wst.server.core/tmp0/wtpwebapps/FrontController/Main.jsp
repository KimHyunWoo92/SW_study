<%@page import="com.smhrd.model.VO"%>
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
	//request에서 result 꺼내기
	String result = (String) request.getAttribute("result");
	%>

	<a href="Join.jsp"><button>회원가입</button></a>
	
	<%
	
		String nick = (String)session.getAttribute("nick");
		if(nick == null){
			out.print("<a href='Login.jsp'><button>로그인</button></a>");
			out.print("<p>로그인 해주세요</p>");
		}else {
			out.print("<p>"+nick+"님 환영합니다.</p>");
			out.print("<a href='LogoutCon.do'><button>로그아웃</botton></a>");
		}
	
	%>
	
	<!-- <a href="Login.jsp"><button>로그인</button></a> -->
	<%
	if(result != null){
		if(result.equals("success")){
			out.print("<h1>회원가입 성공</h1>");
		}
		else{
			out.print("<h1>회원가입 실패</h1>");
		}
	}
	%>
</body>
</html>