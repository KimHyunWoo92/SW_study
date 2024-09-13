package com.smhrd.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ex02Data")
public class ex02DataSend extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1. 요청데이터 가져오기
		// 요청데이터를 다루기 때문에 request 객체 사용
		// getParameter("name값")
		
		String data = request.getParameter("data");
		
//		System.out.println(data);
		
		// 3. 응답데이터 인코딩 -> utf-8
		response.setCharacterEncoding("UTF-8");
		
		// 4. 응답데이터 형식(인코딩방식)을 브라우저한테 알려주기
		//		: 브라우저마다 해석방식이 다르기때문
		response.setContentType("text/html; charset=UTF-8");
		// 4번방식을 사용할경우 3번 생략가능.
		
		
		// 2. 사용자가 입력한 값을 화면에 출력하기
		// 서버 -> 클라이언트(브라우저) : response
		PrintWriter out = response.getWriter();		
		out.print("<html>");
		out.print("<body>");
		
		out.print("전송된 데이터 : "+data);
		
		out.print("</body>");
		out.print("</html>");
		
		
		
		
	}

}
