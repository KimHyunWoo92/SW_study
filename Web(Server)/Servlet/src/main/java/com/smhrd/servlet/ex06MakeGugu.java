package com.smhrd.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ex06MakeGu")
public class ex06MakeGugu extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String color = request.getParameter("color");
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		out.print("<html>");
		out.print("<body>");
		
		out.print("<table border='1'>");
		out.print("<tr>");
		for (int i=1; i<=9; i++) {
			
			out.print("<td>"+(i+1)+"</td>");
		}
		
		out.print("</tr>");
		out.print("</table>");
		
		
		out.print("</body>");
		out.print("</html>");
		
		
		
		
		
	}

}
