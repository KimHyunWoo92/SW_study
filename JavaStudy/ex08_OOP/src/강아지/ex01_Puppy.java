package 강아지;

public class ex01_Puppy {
	// 강아지에 대한 설계도
	// 1)필드(속성)
	// 강아지라면 공통적으로 갖는 특성
	// 털색깔, 눈, 퀴, 코, 입, 다리, 꼬리, 이름, 나이, 종류
	// 1. public : 모든 클래스에서 접근가능
	// 2. private : 클래스 내에서만 접근 가능(클래스 외부에서는 접근 불가)
	// 				-> 단, 클래스 내부에 설계되어있는 메서드를 통해서만 외부에서 접근 가능
	// 3. protected : 동일 패키지와 자식 클래스에서 접근가능.
	// 4. default : 생략된 경우, 동일 패키지내 클래스들만 접근 가능.
		
	
	private String color;
	private String name;
	private String type;
	private int age;
	
	// 기본 생성자 : 객세를 생성
	public ex01_Puppy() {
		
	}
	// 객체를 생성하고 필드의 값을 초기화 시켜주는 생성자
	// 전달인자와 매개변수는 데이터 자료형, 개수 순서가 동일!!
	public ex01_Puppy(String color, String name, int age, String type) {
		// 매개변수를 통해서 초기화 시킬 데이터를 가져오는것.
		// 필드의 값을 초기화 시키는 로직
		// 현재 클래스의 필드 = 메인 클래스에서 받아온 데이터 값
		// 변수명이 동일하면 가장 근접한 곳에 있는 변수로 인식
		// this. -> 현재 클래스를 지칭하는 키워드!!
		this.color = color;
		this.name = name;
		this.age = age;
		this.type = type;
	}
	// 생성자의 특징(constructor)
	// 1. 메소드라면 소괄호를 가지고 있다. -> 생성자도 소괄호가 있다. -> 생성자도 메소드다
	// 2. 생성자의 이름은 클래스(설계도)의 이름과 같다(대,소문자 구분)
	// 3. 생성자는 리턴타입이 없다.(void도 해당하지않는다) -> 그냥 작성할 자리가 마련되어 있지 않다.
	// 4. 기본 생성자(default constructor)는 모든 클래스가 가지고 있으며, 생략되어있음!
	// 5. 만약에 내가 새롭게 필드의 값을 초기화 시키는 생성자를 만들면 기본 생성자의 기능은 잃게된다.
	//	 -> 따라서, 기본생성자를 사용하고 싶다면 생략하지말고 코드로 작성해서 "오버로딩"가능
	
	// [생성자를 선언하는 문법]
	// 1. 매개변수가 없는 생성자(=기본생성자)
	//	  public 클래스이름() {
	// 	  }
	
	
	// 2. 매개변수가 있는 생성자(=필드의 값을 초기화 할 수 있다.)
	//	  public 클래스이름(매개변수1,매개변수2,....){
	//	  	필드의 값을 초기화 시키는 로직
	//	  }
	//
	
	
	
	// 2) 메소드 : 객체의 기능(행위, 행동(
	//		객체라면 하는 공통적으로 하는 행동
	//		걷는다, 짖는다, 먹는다, 잔다, 산책한다
	public void eat() {
		System.out.println("강아지가 밥을 먹는다.");
	}
	
	public void walk() {
		System.err.println("강아지가 걷는다.");
	}
	public void sleep() {
		System.out.println("강아지가 잔다.");
	}
	public void play() {
		System.out.println("강아지가 공을 가지고 논다.");
	}
	//getter /setter : private로 감싸진 필드에 접근 할 수 있도록 도와주는 메서드.
	// 1. getter : 필드의 값을 확인하는 용도 ex)ex01_Puppy.name -> getter
	// 2. setter : 필드의 값을 수정하는 용도 ex)ex01_Puppy.name ="dog" -> setter
	// 필드 : color, name, age, type
	
	public String getColor() {
		// 클래스 필드 값을 돌려줍니다.
		return color;
	}
	public void setColor(String color) {
		// 메인클래스에서 받아온 데이터 값을 현재 필드의 값으로 변경
		this.color = color;		
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	
}
