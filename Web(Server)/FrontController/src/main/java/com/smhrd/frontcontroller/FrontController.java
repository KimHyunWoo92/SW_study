package com.smhrd.frontcontroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.controller.Command;
import com.smhrd.controller.JoinCon;
import com.smhrd.controller.LoginCon;
import com.smhrd.controller.LogoutCon;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 공통으로 실행하는 코드
		request.setCharacterEncoding("UTF-8");
		
		// FrontController의 역할 
		// : 모든 요청을 다 처리하는 servlet
		// : 요청이 무엇이냐에 따라 일반 클래스에게 일을 시키는 주체
		
		// 1. 요청 url 구분하기
		// 1-1. 요청 uri가져오기
		String uri = request.getRequestURI();
		
		// 1-2. cp 가져오기
		String cp = request.getContextPath();
		
		// 1-3. 최종 요청 url 잘라내기
		String endUri = uri.substring(cp.length()+1);
		
		// 모든 기능을 수행하고 최종적으로 이동해야하는 url을 담는 공간
		String path = null;
		
		// 모든 컨트롤러 일반 클래스를 대표할 수 있는 부모 자료형
		Command com = null;
		// 2. 최종 uri에 따라서 각각 일반 클래스 파일을 호출
		if (endUri.equals("JoinCon.do")) {
			com = new JoinCon();
		}
		else if(endUri.equals("LoginCon.do")) {
			com = new LoginCon();			
		}
		else if(endUri.equals("LogoutCon.do")) {
			com = new LogoutCon();
		}
		
		path = com.execute(request, response);
		// 3. 페이지 이동
		if(path.contains("redirect:/")) {
			response.sendRedirect(path.substring(10));
		}else {
			RequestDispatcher rd = request.getRequestDispatcher(path);
			rd.forward(request, response);
		}
		
	}

}
