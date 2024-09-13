package ex03_Login;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginCheck")
public class LoginCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1.요청받은 데이터 꺼내오기 (id,pw)
		String id = request.getParameter("id")  ;
		int pw = Integer.parseInt(request.getParameter("pw"));
		
		
		// 2. 받아온 데이터가 test, 12345 일치하는지 비교
		// 3-1. 일치한다면 session 생성, nick/쿠키몬스터 -> 데이터 저장
		// 3-2. Main.jsp 이동
		if (id.equals("test") && pw == 12345) {
			HttpSession session = request.getSession();
			session.setAttribute("nick","쿠키몬스터");
			response.sendRedirect("Main.jsp");
		}else {
			response.sendRedirect("LoginForm.jsp");
		}	
		// 4. 일치하지 않는다면 LoginForm.jsp로 이동
		
		
	}

}
