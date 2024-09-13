package com.smhrd.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ex03Op")
public class ex03Operation extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1.요청데이터 가져오기
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
		String op = request.getParameter("op");
		
		
		response.setContentType("text/html; charset=UTF-8");
		// op가 +라면 num1+num2 = (num1+num2) 출력
		// op가 -라면 num1-num2 = (num1-num2) 출력
		// op가 *라면 num1-num2 = (num1*num2) 출력
		// op가 /라면 num1-num2 = (num1/num2) 출력
		PrintWriter out = response.getWriter();
		out.print("<html>");
		out.print("<body>");
		
		if (op.equals("+")){
			out.print(num1+op+num2+" = "+(num1+num2));
		}else if (op.equals("-")) {
			out.print(num1+op+num2+" = "+(num1-num2));
		}else if (op.equals("*")) {
			out.print(num1+op+num2+" = "+(num1*num2));
		}else {
			out.print(num1+op+num2+" = "+(num1/num2));
		}
		out.print("</body>");
		out.print("</html>");
		
	}

}
