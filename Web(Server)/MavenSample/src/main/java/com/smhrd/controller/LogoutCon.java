package com.smhrd.controller;

import java.io.IOException;

import javax.print.attribute.HashPrintRequestAttributeSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LogoutCon")
public class LogoutCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		// 1. session 꺼내기
//		HttpSession session = request.getSession();
//		// 2. session 무효화시키기
//		session.invalidate();
		
		// 굳이 스텝을 끊고싶지 않다면 아래와 같이 작성 가능
		request.getSession().invalidate();
		
		// 3. Main.jsp로 이동
		response.sendRedirect("Main.jsp");
	}

}
