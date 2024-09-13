package View;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Scanner;

import Contoller.MemberDAO;
import Model.MemberDTO;

public class Main {

	public static void main(String[] args) {
		/*
		MVC 패턴
		디자인 패턴
			: 계속 같은 문제가 발생하여 이 문제를 해결하고자 형식, 규칙을 지정해 놓은 것!
			-> 개발자들끼리 협업을 할때, 동일한 형식을 갖출 수 있도록 해줌.

		Model , View, Controller
		Model : 데이터를 저장하거나 조작하기 위한 코드들의 모임
		View : 사용자에게 보여지는 부분
		Controller : 실제 기능이 일어나는 부분

		 */
		System.out.println("===== 회원 정보 관리 프로그램 ======");
		Scanner sc = new Scanner(System.in);
		
		while (true) {
			System.out.println("[1] 회원가입 [2] 로그인 [3] 회원 탈퇴 [4] 전체 회원 조회 [5] 회원 정보 수정 >>");
			int choice = sc.nextInt();
			// 1.회원가입
			if (choice == 1) {
				System.out.println("==== 회원 가입 ====");

					
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
				
				// MemberDTO 객체 생성
				// dao에게 보내줄 데이터를 하나로 묶어준다!
				MemberDTO dto = new MemberDTO(id,pw,name,age,score);
				
				MemberDAO dao = new MemberDAO();
				int row = dao.join(dto);
				
				
				// 5. 결과를 이용한 작업처리
				// : 사용자에게 어떤 모습을 보여줄건지 정의
				if (row>0) {
					System.out.println("회원가입 성공");
				}else {
					System.out.println("회원가입 실패");
				}
				
				}
			// 2. 로그인
			else if (choice ==2) {
				System.out.println("==== 로그인 ====");
				
				// 1. 사용자에게 아이디와 비밀번호를 입력받기
				
				System.out.print("아이디 입력 : ");
				String id = sc.next();
				
				System.out.print("비밀번호 입력 : ");
				String pw = sc.next();
				
				// 1. dao의 객체 생성
				// 2. dto의 객체 생성
				MemberDTO dto = new MemberDTO(id, pw);
				
				MemberDAO dao = new MemberDAO();
				String uName = dao.login(dto);
				
				if (uName != null) {
					// 로그인이 성공했다면,
					System.out.println(uName+"님 환영합니다.");
					
				}else {
					System.out.println("로그인이 실패했습니다.");
					System.out.println("아이디/비밀번호를 확인해주세요.");
					
				}
				
				}
			// 3. 회원탈퇴
			else if (choice ==3) {
					System.out.println("==== 회원 탈퇴 ====");
					
					System.out.print("아이디 입력 : ");
					String id = sc.next();
					
					System.out.print("비밀번호 입력 : ");
					String pw = sc.next();
					
					MemberDTO dto = new MemberDTO(id,pw);
					
					MemberDAO dao = new MemberDAO();
					int row = dao.delete(dto);
					
					if (row>0) {
						System.out.println("탈퇴 성공");
					}else {
						System.out.println("탈퇴 실패");
					}
					
				}
			
			// 4. 전체 회원 조회(강사님)
//			
			else if (choice ==4){
				MemberDAO dao = new MemberDAO();
				ArrayList<MemberDTO> list = dao.selectAll();
				
				for(MemberDTO dto:list) {
				System.out.println(dto.getId()+"\t"+dto.getName()+"\t"+dto.getAge()+"\t"+dto.getScore());
				}
			}
//			
			
			
			// 5. 회원 정보 수정
			else if (choice ==5) {
					System.out.println("==== 회원 정보 수정 ====");

					
					// 회원 정보를 수정하는 칸
					
					
					System.out.print("아이디 입력 : ");
					String id = sc.next();
					
					System.out.print("비밀번호 입력 : ");
					String pw = sc.next();
					
					System.out.print("변경할 값 : ");
					int val = sc.nextInt();
					
					MemberDTO dto = new MemberDTO(val,id,pw);
					MemberDAO dao = new MemberDAO();
					int row = dao.update(dto);
					
					
					if (row>0) {
						System.out.println("수정 성공");
					}else {
						System.out.println("수정 실패");
					}
						
				}
			// 6. 종료
			else {
					System.out.println("종료합니다.");
					break;
				}
			
			
		}




	}

}
