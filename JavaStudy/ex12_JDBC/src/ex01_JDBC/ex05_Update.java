package ex01_JDBC;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class ex05_Update {

	public static void main(String[] args) {
		
		// 회원 정보를 수정하는 칸
		
		Scanner sc = new Scanner(System.in);
		
		System.out.print("아이디 입력 : ");
		String id = sc.next();
		
		System.out.print("비밀번호 입력 : ");
		String pw = sc.next();
		
		System.out.print("변경할 값 : ");
		int val = sc.nextInt();
		
		
		
		
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
			
			
			String sql = "UPDATE SWCAMPMEMBER SET score = ? WHERE ID = ? AND PW = ?";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, val);
			
			psmt.setString(2, id);
			psmt.setString(3, pw);
			
			
			int row = psmt.executeUpdate();
			
			
			if (row>0) {
				System.out.println("수정 성공");
			}else {
				System.out.println("수정 실패");
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
	
		
		// 회원 정보를 수정하는 칸
		
	}

}
