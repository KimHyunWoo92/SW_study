package com.smhrd.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ex01Print
 */
@WebServlet("/ex01")
public class ex01Print extends HttpServlet {
	

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// 서버 -> 클라이언트한테 웹 페이지를 응답.
		// PrintWriter : 텍스트를 출력하는 스트림(통로)
		
		PrintWriter out = response.getWriter();
		
		// html파일을 한글문서같이 텍스트 형태로 써줘야 함
		// out.print("<html><body><h1>Hello World!</h1></body></html>");
		out.print("<html>");
		out.print("<body>");
		out.print("<h1>Hello World!!!</h1>");
		out.print("</body>");
		out.print("</html>");
		
		
		
	}

}
