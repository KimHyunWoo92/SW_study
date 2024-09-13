package Contoller;

import java.sql.Array;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Model.MemberDTO;

public class MemberDAO {
	
	// Data Access Objcet : 데이터에 접근하는 것을 도와주는 객체
	// DB와 연결해서 INSERT, DELETE, UPDATE, SELECT 하는 코드들의 모음
	// 메소드 형태로 코드 작성
	
	// 필드
	private Connection conn = null;
	private PreparedStatement psmt = null;
	private ResultSet rs = null;
	
	// 공통으로 사용할 메소드
	
	// DB연결 메소드
	private void getConn() {
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "hr";
			String password = "12345";
			
			conn = DriverManager.getConnection(url, user, password);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 자원 정리 메소드
	private void getClose() {

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
	
	
	// 1. 회원가입 메소드
	public int join(MemberDTO dto) {
		
		int row = 0;
		
		try {
			getConn();		
			String sql = "INSERT INTO SWCAMPMEMBER VALUES (?,?,?,?,?)";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPw());
			psmt.setString(3, dto.getName());
			psmt.setInt(4, dto.getAge());
			psmt.setInt(5, dto.getScore());
			

			row = psmt.executeUpdate();
			
			if (row>0) {
				System.out.println("회원가입 성공");
			}else {
				System.out.println("회원가입 실패");
			}
			
			} catch (Exception e) {			
				e.printStackTrace();
				
			} finally {
				getClose();
			}
			return row;
		}
	// 2.로그인
	public String login(MemberDTO dto) {
		
		String uName = null;
		
		try {
			
			getConn();
			String sql = "SELECT * FROM SWCAMPMEMBER WHERE ID = ? AND PW = ?";
			
			psmt = conn.prepareStatement(sql);
			
			// ? 인자  채워주기
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPw());
			
			// 4. sql구문 전송
			rs = psmt.executeQuery();
			
			if (rs.next()) {
				uName = rs.getString("name");				
			}			
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				getClose();
			}return uName;
	}
	// 3. 회원 탈퇴
	public int delete(MemberDTO dto) {
		
		int row = 0;
		try {
			getConn();
			String sql = "DELETE FROM SWCAMPMEMBER WHERE ID = ? AND PW = ?";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1,dto.getId());
			psmt.setString(2,dto.getPw());
			
			row = psmt.executeUpdate();
			
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				getClose();
			}
		return row;
	
		
	
	} 

	// 4. 전체 회원 정보(강사님)
	public ArrayList<MemberDTO> selectAll(){
	 
		
		MemberDTO dto = null;
		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
	
		try {
			getConn();
			String sql = "SELECT * FROM SWCAMPMEMBER";
		
			psmt = conn.prepareStatement(sql);
			
			// 4. sql구문 전송
			rs = psmt.executeQuery();

			while (rs.next()) {
				String id = rs.getString("id");
				String name = rs.getString("name");
				int age = rs.getInt("age");
				int score = rs.getInt("score");
	
				dto = new MemberDTO(id, "", name, age, score); //id,name,age,score
				list.add(dto);
				}
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				getClose();
			}return list;	
		}
	 
	 
	
	
	
	// 5. 회원 정보 수정
	public int update(MemberDTO dto) {
		
		int row = 0;
		try {		
			getConn();
			String sql = "UPDATE SWCAMPMEMBER SET score = ? WHERE ID = ? AND PW = ?";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, dto.getVal());
			
			psmt.setString(2, dto.getId());
			psmt.setString(3, dto.getPw());
			
			row = psmt.executeUpdate();

			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				getClose();
			}return row;
		}
	
	
	
	
	
	
}
