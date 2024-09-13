package ex02_Session;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/MakeSession")
public class ex01_MakeSession extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1. 세션 꺼내오기
		HttpSession session = request.getSession();
		
		// 2. 세션안에 데이터 저장하기
		// : 세션이라는 저장공간은 브라우저가 닫히기 전까지만 유지가 가능하다.
		session.setAttribute("data","임경남");
		// : 세션안에 저장되어있는 데이터는 서버측에서 관리하기 때문에
		// : 별도로 response에 담아줄 필요가 없다.
		
		// 세션에 들어있는 데이터 삭제하기
		session.removeAttribute("data");
		// session에 있는 모든 정보 삭제하기
		session.invalidate();
		
		// 3. ex01GetSession.jsp로 이동하기
		response.sendRedirect("ex01GetSession.jsp");
		
		
		
	}

}
