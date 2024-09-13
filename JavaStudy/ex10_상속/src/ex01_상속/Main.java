package ex01_상속;

public class Main {

	public static void main(String[] args) {
		
		Normal nor = new Normal();
		
		nor.jump();
		
		
		// ==============================
		// 1. 상속 : 부모 클래스(슈퍼클래스)가 가진 필드, 메서드를 자식 클래스(서브 클래스)가 받아서 재사용 혹은 확장하는 것.
		//			public class 자식 클래스 extends 부모 클래스
		
		
		First first = new First();
		
		first.front();
		
		// private : 해당 클래스 내에서만 접근 가능
		// protected : 같은 패키지 안에서만, 상속관계는 공유 가능
		// package(default) : 같은 패키지 안의 클래스들 끼리만		
		// public : 누구나
		first.hp = 100;
		
		first.atk = 100;
		first.attack();
		
		// ============================
		
		// 2. 상속의 특징
		// (1) 다중 상속을 지원하지 않음
		// (2) 상속 횟수의 제한x
		//	   연이어서 상속 주로를 여결 할 수 있다.
		//	   (점프,앞,뒤, 공격 모든 기능을 사용할 수 있고, skill 기능 또한 사용할 수있는
		// Second Class 만들어봅시다.
		
		Second second = new Second();
		second.attack();
		second.skill();
		
		// (3) 모든 클래스는 java.lang.Object 클래스를 상속받는다.
		// 	   Object를 최상위 클래스 라고 부른다.
		
		// 3. 메소드 오버라이딩
		// 오버로딩 : 중복정의 : 하나의 클래스 안에서 같은 이름의 메소드를 여러개 정의하는 것
		// 			조건 - 매개변수가 달라야한다.
		// 오버라이딩 : 재정의 : 부모클래스가 가지고 있는 메소드를 자식 클래스가 다시 정의하는것.
		//			 리턴타입, 이름, 매개변수는 유지한 채로 메소드 안의 {} 로직만 재정의 하는것.
		
		nor.jump();
		first.jump();
		
		// 4. 캐스팅 Casting - 형변환
		// (1) 기본 자료형의 형변환 : 데이터 타입이 가지는 용량
		//	   작은 --> 큰 : 자동 형변환
		//	   큰 --> 작은 : 강제 형변환
		
		int a = 50;
		long b = a;
		double c = 3.14;
		int d = (int) c;
		
		// (2) 참조 자료형의 형변환 : 필드나 메소드에 접근 할 수 있는 권한
		// 						 상속 관계에 있는 클래스들 간의 형변환
		
		// (2.1) Upcasting
		//			: 자식 클래스가 부모 클래스로 형변환
		// 			: 상위 클래스가 가지고 있는 요소에 대해서만 사용이 가능
		Normal up = new First();
		// new First(); 	-> Normal
		// front			-> front(o)
		// back				-> back(o)
		// jump(Override)	-> jump(Override)(o) 오버라이드 된 메소드는 로직이 유지
		// attack			-> attack(x) 권한x 실행x
//		up.jump();
//		up.attack(); 권한이 없기때문에 자동완성조차 되지않음.
		// hp				-> hp(o)
		// atk				-> atk(x) 권한x 사용x
		Object obj = new First();		
		
		// (2.2) DownCasting
		// 부모클래스가 자식클래스로 변환되는 과정
		// ** 업캐스팅이 된 객체를 대상으로만 가능
		// ** 강제 형변환 - 위험성 때문에
		// 업캐스팅시 권한이 없는 메소드가 사라지는게 아니고, 숨겨진것일 뿐
		// 그렇기때문에 다운캐스팅시 정상적으로 사용가능
		
		First down = (First) up;
		
		down.attack();
		down.back();
		
		// ==========================
		
		// 5. 오버라이드 --> 부모 클래스가 일종의 가이드라인, 규칙으로 작용을 할 수 있다.
		// 	  필요한, 구현해야하는 메소드의 형태를 일단 부모 클래스로써 구현하고
		//	  디테일은 자식클래스에서 잡는 형식
		
		// --> 추상 클래스/ 인터페이스
		
		
		
		
		
		
		
	}

}
