package ex01_JDBC;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class ex02_Login {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		// 1. 사용자에게 아이디와 비밀번호를 입력받기
		
		System.out.print("아이디 입력 : ");
		String id = sc.next();
		
		System.out.print("비밀번호 입력 : ");
		String pw = sc.next();
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			// 1.드라이버 로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// 2. DB연결통로 열기(url,user,password)
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "hr";
			String password = "12345";
			
			conn = DriverManager.getConnection(url, user, password);
			
			if (conn != null) {
				System.out.println("연결 성공");
			}else {
				System.out.println("연결 실패");
			}
			
			// 3. sql문 준비
			// 로그인 : 테이블에 데이터가 존재하는 지 확인 >> select
			// 아이디, 비밀번호가 일치하는 데이터의 모든 컬럼을 가져오기!
			String sql = "SELECT * FROM SWCAMPMEMBER WHERE ID = ? AND PW = ?";
			
			psmt = conn.prepareStatement(sql);
			
			// ? 인자  채워주기
			psmt.setString(1, id);
			psmt.setString(2, pw);
			
			// 4. sql구문 전송
			rs = psmt.executeQuery();
			// ResultSet 이란?
			// : 조회된 데이터 결과를 테이블과 같은 형태로 표현해주는 집합자료구조.
			// : cursor를 가지고 있다(처음에는 column명을 가리키고 있음)
			// : cursor가 가리키고 있는 데이터만 가지고 올 수 있다.
			
			// rs.next() : cursor를 한행 아래로 내리는 작업
			
			// 데이터가 있다면 true, 없다면 false 
			if (rs.next()) {
				// 로그인이 성공했다면,
				String name = rs.getString("name");
				System.out.println(name+"님 환영합니다.");
			}else {
				System.out.println("로그인이 실패했습니다.");
				System.out.println("아이디/비밀번호를 확인해주세요.");
			}
			
			
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			// 5. DM연결 종료
			// 열어준 순서의 반대
			try {
				if (rs != null) 
					rs.close();
				if (psmt != null)
					psmt.close();
				if (conn != null)
					conn.close();
				sc.close();
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			
			
		}
		

	}

}
