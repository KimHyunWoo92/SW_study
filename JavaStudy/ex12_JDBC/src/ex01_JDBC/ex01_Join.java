package ex01_JDBC;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class ex01_Join {

	public static void main(String[] args) {
		
		// JDBC(Java Database Connectivity)
		// : JDBC 인터페이스 사용방법!
		
		// 1. 드라이버 로딩
		// JDBC 드라이버란?
		// : java에서 제공해주는 인터페이스 들을 데이터베이스 회사에서
		//   상속을 받아서 로직을 구현한 클래스파일들의 모음
		
		Scanner sc = new Scanner(System.in);
		System.out.print("ID 입력 : ");
		String id = sc.next();
		
		System.out.print("PW 입력 : ");
		String pw = sc.next();
		
		System.out.print("Name 입력 : ");
		String name = sc.next();
		
		System.out.print("Age 입력 : ");
		int age = sc.nextInt();
		
		System.out.print("Score 입력 : ");
		int score = sc.nextInt();
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			// try 구문
			// : 예외가 발생할 수도 있지만, 우선 시도해보는 구간
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// 2. 데이터베이스 연결
			// 준비물 3가지
			// 1) 연결 경로
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			// thin타입 : JDBC 드라이버가 thin타입이다.
			// @localhost : ip주소(127.0.0.1)
			// 1521 : port 번호(오라클 사용-1521)
			// xe : DB의 기본이름
			// 2) 계정 이름
			String user = "hr";
			// 3) 계정 비밀번호
			String pw1 = "12345";
			
			conn = DriverManager.getConnection(url, user, pw1);
			// Connection이란?
			// : 데이터베이스에 접속하기 위한 모든 메소드를 가지고 있는 인터페이스
			// --> 데이터베이스와 같은 모든 통신은 Connection을 통해서만 이루어진다.
			// Connection == MetaData
			// --> 사용가능한 테이블 목록, 컬럼들에 대한 정보 등
			//	   연결된 데이터베이스의 정보들을 전부 가지고 있음.
			
			if (conn != null) {
				System.out.println("연결이 성공했습니다.");
			}else {
				System.out.println("연결 실패");
			}
			
			// 3. Query문 전송
			// 1) Query문 작성
			String sql = "INSERT INTO SWCAMPMEMBER VALUES (?,?,?,?,?)";
			
			// ? 인자
			// : 사용자로부터 어떤 데이터가 들어올지 모를 때 사용
			// : 지정한 데이터 공간만큼
			
			psmt = conn.prepareStatement(sql);
			// --> 전송하기 전에 sql문을 담아서 전송할 수 있는 형식으로 변경
			
			// ? 인자 입력작업
			// 데이터 바인딩 작업
			psmt.setString(1, id);
			psmt.setString(2, pw);
			psmt.setString(3, name);
			psmt.setInt(4, age);
			psmt.setInt(5, score);
			
			
			// 4. sql구문 실행
			int row = psmt.executeUpdate();
			
			// 5. 결과를 이용한 작업처리
			// : 사용자에게 어떤 모습을 보여줄건지 정의
			if (row>0) {
				System.out.println("회원가입 성공");
			}else {
				System.out.println("회원가입 실패");
			}
			
		} catch (Exception e) {
			// --> 모든 예외상속
			// 모든 예외클래스는 Exception을 상속받는다.
			// --> Exception e = new ClassNotFoundException();
			// ----> 업캐스팅이 일어나는 개념
			
//			} catch (ClassNotFoundException | SQLException e) {
			// catch 구문
			// : 예외가 발생했을때, 어떤 로직을 실행할건지 작성하는 구간
			
			e.printStackTrace();
			// 예외상황이 왜 발생했고, 어디서 문제가 나고 있는지
			// 출력해주는 구문! --> 개발할떄만 사용하는 것이 좋음.
		} finally {
			// 위에서 예외상황이 발생하더라도 무조건 한번은 들어오는 구간
			// 6. DB연결을 종료 -> 사용한 자원 반납
			try {
				if (psmt != null)
					psmt.close();
				if (conn != null)
					conn.close();
				sc.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		

	}

}
