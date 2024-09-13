package ex01_JDBC;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class ex04_SelectAll {

	public static void main(String[] args) {

		// 전체 회원 정보 조회
		// 출력 결과 예시
		// ===== 전체 회원 정보 조회 =====
		// id	name	age  score
		// smhrd asdf   20	  0
		
		
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
			String sql = "SELECT * FROM SWCAMPMEMBER";
			
			psmt = conn.prepareStatement(sql);
			
			
			// 4. sql구문 전송
			rs = psmt.executeQuery();
			// ResultSet 이란?
			// : 조회된 데이터 결과를 테이블과 같은 형태로 표현해주는 집합자료구조.
			// : cursor를 가지고 있다(처음에는 column명을 가리키고 있음)
			// : cursor가 가리키고 있는 데이터만 가지고 올 수 있다.
			
			// rs.next() : cursor를 한행 아래로 내리는 작업
			
			
			
			// 데이터가 있다면 true, 없다면 false
			System.out.println("======전체 데이터 조회======");
			
			while (rs.next()) {
				String id = rs.getString("ID");
				String name = rs.getString("name");
				int age = rs.getInt("Age");
				int score = rs.getInt("Score");
				
				System.out.println(id+"\t"+name+"\t"+age+"\t"+score);
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
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			
			
		}
	
	}

}
