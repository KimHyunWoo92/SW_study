package ex01_JDBC;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class ex03_delete {

	public static void main(String[] args) {
		
		// 1. 사용자에게 id,pw 입력받기
		// 2. 드라이버 로딩
		// 3. SQL문 전송
		// 4. SQL문 전송
		// 5. DB연결 종료
		
		Scanner sc = new Scanner(System.in);
		
		System.out.print("아이디 입력 : ");
		String id = sc.next();
		
		System.out.print("비밀번호 입력 : ");
		String pw = sc.next();
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		
		
		try {
			
			
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
			
			
			String sql = "DELETE FROM SWCAMPMEMBER WHERE ID = ? AND PW = ?";
			
			psmt = conn.prepareStatement(sql);
			
			// DML(insert, update, delete) : 테이블에 영향을 주는 쿼리문
			// 	-> excuteUpdate 사용
			//	-> 리턴값이 int값
			
			
			// executeQuery() -> 테이블에 영향을 미치지 않는 쿼리문(있는 그대로 출력)
			//	-> 리턴값이 "resultSet"
			
			
			// ? 인자  채워주기
			psmt.setString(1, id);
			psmt.setString(2, pw);
			
			
			int row = psmt.executeUpdate();
			
			
			if (row>0) {
				System.out.println("탈퇴 성공");
			}else {
				System.out.println("탈퇴 실패");
			}

			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				// 5. DM연결 종료
				// 열어준 순서의 반대
				try {
				
					if (psmt != null)
						psmt.close();
					if (conn != null)
						conn.close();
					
				} catch (SQLException e) {
					
					e.printStackTrace();
				}
			}
	}

}
