package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.DAO;
import com.smhrd.model.VO;

@WebServlet("/LoginCon")
public class LoginCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		//1. 한글 인코딩
		request.setCharacterEncoding("UTF-8");
		//2. 요청 데이터 꺼내오기(2개)
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		//2-2 요청데이터 하나로 묶어주기(VO)
		VO vo = new VO(id, pw);
		//3. DAO 생성	
		//4. DAO에서 login메소드 호출
		VO result = new DAO().login(vo);
		
		// 4-1. result에서 닉네임만 빼오기
		String nick = result.getNick();
		
		// 5. 로그인에 성공했다면, id, nick을 session에 담아 main.jsp로 이동
		if(result !=null) {
			// 로그인 성공
			// 5-1. session 꺼내기
			HttpSession session = request.getSession();
			session.setAttribute("nick", nick);
		}
		
		// 6. main.jsp로 이동
		response.sendRedirect("Main.jsp");
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
