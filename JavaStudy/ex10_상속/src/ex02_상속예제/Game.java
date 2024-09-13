package ex02_상속예제;

public abstract class Game {
	// 1. 추상 클래스
	// 		: 추상 메소드를 하나라도 가지고 있다면 반드시 추상클래스가 되어야한다.
	//		: 추상 클래스도 일반메소드를 가질 수 있다.
	//		: abstract 키워드를 사용하여 선언한다.
	
	public abstract void start();
		// 2. 추상 메소드
		//	  : {}가 없는 메소드
		// 	  : 선언(틀 : 리턴타입, 매개변수,메소드명)은 되어있으나 로직이 구현되지 않은 메소드
		//	  : abstract 키워드를 사용하여 선언한다.
	
	public void save() {
		System.out.println("플레이 저장");
	}
}
