package ex08_OOP기초;

public class ex02_main {

	public static void main(String[] args) {
		
		// 1. 객체(Object) 생성해보기
		// -- 클래스 설계도면을 기반으로 생성.
		// 회원 자료형 만들기! 변수명 : member1
		// -> 자료형 변수명 = new 자료형();
		
		ex01_member member1 = new ex01_member();
		// member1 > 주소값이 저장되어 있는 레퍼런스 변수
		
		System.out.println(member1);
		// 2. 객체 안에 있는 필드에 접근하는 ㅏㅇ법
		// 레퍼런스 변수명.필드
		// . --> 접근의 의미! 가지고 있는!
		
		System.out.println(member1.name);
		// field에 아무런 값도 얺지 않았을 때는 기본값이 세팅된다.
		// String --> null
		// int --> 0
		// double --> 0.0
		
		// 3.객체 안에 있는 필드 데이터 변경하기.
		member1.name = "이도연";
		System.out.println(member1.name);
		
		// 나이 : 20/ id:smhrd / pw : 12345
		
		member1.age = 20;
		member1.id = "smhrd";
		member1.pw = "12345";

		
		System.out.println(member1.age);
		System.out.println(member1.id);
		System.out.println(member1.pw);
		
		
		// 하나의 클래스 설계도면으로 여러개의 객체 생성 가능
		// 짝궁 데이터를 저장하는 member2 객체 생성
		// 안에 저장되어있는 데이터 모두 출력
		
		ex01_member member2 = new ex01_member();
		
		member2.name = "이선우";
		member2.age = 20;
		
		member2.id = "smhrd2";
		member2.pw = "23456";
		
		System.out.println(member2.name);
		System.out.println(member2.age);
		System.out.println(member2.id);
		System.out.println(member2.pw);
		
		
		// 메소드 실행
		member1.kakaoTalk("여러분 금요팅 하세요~~");
		member2.sendMoney(10000);
		
	}

}
