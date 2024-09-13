package ex01_Cookie;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/MakeCookie")
public class ex01_MakeCookie extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Cookie
		// : 클라이언트(브라우저)에 저장되는 작은 데이터
		// : 순서가 없는 데이터의 집합
		// : 중복이 허용되지 않는 name과 value 한쌍으로 이루어져있다.
		// : 만료기한(나이)가 존재한다.
		
		// 1. 쿠키 생성하기
		Cookie cookie = new Cookie("season","여름");
		
		// 1-1. 쿠키의 만료기한 설정하기
		// 만료기한 미설정시, session이라고 만료기한 설정
		// session 만료기한?
		// : 브라우저가 닫힐때 까지 유지하겠다.
		// cookie.setMaxAge(0);--> name값이 season인 데이터를 삭제
		cookie.setMaxAge(80000);
		
		// 2. 쿠키를 브라우저에 보내주기(저장하기)
		response.addCookie(cookie);
		
		// 3. 페이지 이동(redirect 방식)
		response.sendRedirect("ex01GetCookie.jsp");
		
		
	}

}
