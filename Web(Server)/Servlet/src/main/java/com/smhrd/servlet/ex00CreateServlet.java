package com.smhrd.servlet;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// annotation(주석) : 기능이 있는 주석
// url-mapping : Web browser에서 Servlet을 동작시키기위해 실제 Java 클래스의 이름 대신,
//				 Servlet을 요청하기 위한 문자열을 Servlet 클래스와 Mapping 시키는것.
//	: 길다 - > 불편함을 해소
//	: 이름이 같다 -> 보안상의 이유

// url-mapping 방법
// 1. @webServlet("/매핑값")
// 2. 

@WebServlet("/ex00Create")
public class ex00CreateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	// 1. 생성자 메소드 : 객체 생성(자바 객체) -> 서블릿으로서의 역할은 하지 못함(요청,응답불가)
    public ex00CreateServlet() {
        super();
        System.out.println("생성자 호출");
        
    }
    
    // 2. init : 서블릿 객체를 초기화(요청, 응답 가능)
    // 처음에 딱 한번만 호출됨.
	public void init(ServletConfig config) throws ServletException {
		System.out.println("init  메소드 호출");
	}
	
	// service : 클라이언트 요청 처리(요청 방식 - get/post/put/delete/patch)
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Service 호출");
		doGet(request,response);
		doPost(request,response);
	}
	
	// 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet 메소드 호출");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost 메소드 호출");
	}
	
	// 4. destroy : 서블릿 종료시 마지막으로 딱 한번만 호출 됨 -> 객체 소멸
	public void destroy() {
		System.out.println("destroy 메소드 호출!");
	}
}
