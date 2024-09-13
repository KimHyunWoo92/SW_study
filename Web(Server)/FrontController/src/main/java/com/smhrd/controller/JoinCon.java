package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.smhrd.model.DAO;
import com.smhrd.model.VO;

// 일반 클래스로 만들어주기 => POJO(Plain Old Java Object)
public class JoinCon implements Command{

	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			
		//Controller
		
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String nick = request.getParameter("nick");
		VO vo = new VO(id, pw, nick);
		
		int row = new DAO().join(vo);
		//System.out.println(id+pw+nick);
		
		if(row>0) {
			//회원가입에 성공했다면
			//main.jsp로 이동
			System.out.println("회원가입 성공");
			request.setAttribute("result", "success");
			
			return "Main.jsp";
			
		}else {
			//회원가입에 실패했다면
			System.out.println("회원가입 실패");
			//redirect방식으로
			
			// redirect:/ --> 약속기호
			// redirect 방식으로 이동해라!! 라고, FrontController에게 알려주는 역할
			
			return "redirect:/Join.jsp";
		
		}

	
	
	}

}
