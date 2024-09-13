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
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		if (id.equals("smart") && pw.equals("123")){
			// 로그인 성공
			// 쿼리스트링 : url뒤쪽에?name1=value1&name2=value2...
			// response.sendRedirect("ex05LoginSuccess.jsp?id="+id);
			
			// forwarding 방식
			RequestDispatcher rd = request.getRequestDispatcher("ex05LoginSuccess.jsp");
			request.setAttribute("id", id);
			rd.forward(request, response);
		}else{
			//로그인 실패
			response.sendRedirect("ex05LoginFail.jsp");
		}
	%>

</body>
</html>