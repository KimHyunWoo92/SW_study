package com.smhrd.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ex04Make")
public class ex04MakeTable extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 404에러 : 경로문제
		// 505에러 : 서버 혹은 코드문제
		
		int num = Integer.parseInt(request.getParameter("num"));
		PrintWriter out = response.getWriter();
		
		out.print("<html>");
		out.print("<body>");
		out.print("<table border='1'>");
		out.print("<tr>");
		
		for (int i=0; i<num; i++) {
			out.print("<td>"+(i+1)+"</td>");
		}
		out.print("</tr>");
		out.print("</table>");
		out.print("</body>");
		out.print("</html>");
		
		
		
	}

}
