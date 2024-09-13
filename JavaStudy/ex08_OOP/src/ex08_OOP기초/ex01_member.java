package ex08_OOP기초;

public class ex01_member {
	/*
	 나만의 자료형 설계도면
	 -- main method 포함하지X
	 -- 자체적으로 실행되지X
	 -- 진짜 설계도면 그 이상 그 이하도 아님!
	 -- OOP(Object Oriented Programming)
	 */
	// 1. Field(Data, 속성)
	 String name;
	 int age;
	 String id;
	 String pw;
	 
	 // 2. Method(Logic, 행위, 기능)
	 // 카카오톡에서 메세지 보내기
	 public void kakaoTalk(String msg) {
		 System.out.println(name+"님이 "+msg+" 을 전송합니다.");
	 }
	 
	 // 송금하기
	 public void sendMoney(int money) {
		 System.out.println(name +"님이 "+ money+ " 를 송금합니다.");
	 }
	 
	 
	 
}
