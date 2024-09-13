package com.smhrd.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ex08Form")
public class ex08Form extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		
		// 아이디
		String id = request.getParameter("id");
		int pw = Integer.parseInt(request.getParameter("password"));
		int pwck = Integer.parseInt(request.getParameter("passcheck"));
		String gender = request.getParameter("gender");
		String blood = request.getParameter("blood");
		String date = request.getParameter("date");
		String[] hobby = request.getParameterValues("hobby");
		String color = request.getParameter("color");
		String strText = request.getParameter("strText");
		
		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();
		
		out.print("<html>");
		out.print("<body>");
		
		out.print("아이디 : "+id);
		out.print("<br>");
		out.print("비밀번호 : "+pw);
		out.print("<br>");
		if (pw == pwck) {
			out.print("비밀번호가 일치합니다.");
		}else {
			out.print("비밀번호가 일치하지 않습니다.");
		}
		out.print("<br>");
		out.print("성별 : "+gender);
		out.print("<br>");
		out.print("혈액형 : "+blood);
		out.print("<br>");
		out.print("생일 : "+date);
		out.print("<br>");
		out.print("취미 : ");
		for (int i=0; i<hobby.length; i++) {
			out.print(hobby[i]+" ");
		}
		out.print("<br>");
		out.print("좋아하는 색 : "+color);
		out.print("<br>");
		out.print("남기고싶은 말 : "+strText);
		out.print("<br>");
		
		out.print("</body>");
		out.print("</html>");
		
		
		
		
		
	}

}
