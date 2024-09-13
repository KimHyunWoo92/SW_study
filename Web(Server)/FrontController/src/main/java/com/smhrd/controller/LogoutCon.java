package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class LogoutCon implements Command{
	
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1. session 꺼내기
//		HttpSession session = request.getSession();
//		// 2. session 무효화시키기
//		session.invalidate();
		
		// 굳이 스텝을 끊고싶지 않다면 아래와 같이 작성 가능
		request.getSession().invalidate();
		
		// 3. Main.jsp로 이동
		return "redirect:/Main.jsp";
	}

}
