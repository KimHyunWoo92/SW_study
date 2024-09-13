package com.smhrd.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ex07GetPost")
public class ex07GetPost extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 2. post방식 인코딩
		request.setCharacterEncoding("UTF-8");
		
		// 1. 요청데이터 가져오기
		String name = request.getParameter("name");
		System.out.println("데이터 : "+ name);
		
		String method = request.getMethod();
		System.out.println("요청방식 : "+ method);
		
		// 3. 응답데이터 인코딩
//		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		out.print("<html>");
		out.print("<body>");
		out.print(name+"님 환영합니다!");
		out.print("</body>");
		out.print("</html>");
		
		
	}

}
