package ex02_ArrayList;

import java.util.ArrayList;

public class ex01_Main {

	public static void main(String[] args) {
		
		/*
		 ArrayList
		 	: 크기가 가변적인 배열과 같은 형태를 가진 클래스
		 	
		 1. ArrayList 생성
		 	: 레퍼런스 타입의 데이터만 저장 할 수 있다.
		 	-- String, Poketmon, Student
		 	
		 */
		
		ArrayList<String> list = new ArrayList<String>();
		
		// 2.데이터 추가하기
		list.add("이도연");
		list.add("서보경");
		list.add("안현진");
		
		//3. 데이터 가져오기
		System.out.println(list.get(1));
		
		//4. 데이터를 특정위치에 추가하기
		list.add(2, "안수빈");
		System.out.println(list.get(2));
		System.out.println(list.get(3));
		
		// 5. 데이터 삭제하기
		list.remove(2);
		System.out.println(list.get(2));
		

		// 6. 데이터 크기 알아보기
		System.out.println(list.size());
		
		// 7. 데이터 전체 삭제하기
		list.clear();
		System.out.println(list.size());
		
	}

}
