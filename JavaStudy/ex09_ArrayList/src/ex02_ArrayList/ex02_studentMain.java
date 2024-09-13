package ex02_ArrayList;

import java.util.ArrayList;

public class ex02_studentMain {

	public static void main(String[] args) {
		
		// 1. Student 자료형을 보관할 수 있는 sList 라는 이름을 가진 ArrayList 생성
		ArrayList<ex02_student> sList = new ArrayList<ex02_student>();
		
		// 2. 데이터 추가(여러분의 이ㅡㄻ, 나이를 가지고 있는 데이터를 추가)
		sList.add(new ex02_student("김현우",33));
		
		System.out.println(sList.get(0).name);
		System.out.println(sList.get(0).age);
		
		// 4. 팀원 데이터 전부 추가하기!!
		sList.add(new ex02_student("이선우",26));
		sList.add(new ex02_student("홍경석",26));
		sList.add(new ex02_student("나승엽",24));
		
		// 5. 팀원 이름, 나이 전부 출력 -> for each문
		System.out.println("=== 팀원 정보 ===");
		for (ex02_student s:sList) {
			System.out.println(s.getName()+"\t"+s.getAge());
		}
		
		// === 팀원 정보 ===
		// 이도연 20
		// 서보경 20
		// 안현진 20
	}

}
