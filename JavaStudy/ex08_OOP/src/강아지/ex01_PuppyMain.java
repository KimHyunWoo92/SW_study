package 강아지;

public class ex01_PuppyMain {
	public static void main(String[] args) {
		
		
		// 설계도를 실행하는 공간(사용되는 곳)
		// 설계도를 이용해서 객체를 만드는 법
		// 설계도의 이름 변수명 = new 설계도의 이름();
		// 필드의 값을 초기화 하기전의 기본값
		// String = null, int = 0, double = 0.0
		// 값을 초기화 하다 : 변수를 선언하고 "처음" 값을 넣는다.
		// 필드의 개수와 필드의 값을 초기화하는 줄의 수가 비례
		

		ex01_Puppy puppy = new ex01_Puppy();
		System.out.println("값을 초기화 하기전 : "+puppy.getColor()); // return값으로 color를 가져온다.
		puppy.setColor("은색");
		System.out.println("값을 초기화 이후 : "+puppy.getColor());
//		puppy.getColor = "은색";
//		puppy.age = 5;
//		puppy.type = "푸들";
//		
//		System.out.println(puppy.name);
		
		// 생성자의 역할 : 1)객체를 생성하고 2)필드의 값을 초기화하는 역할
		
		ex01_Puppy puppy2 = new ex01_Puppy("갈색","방울이",4,"말티즈");
		
		
		// Q : 내가 키우고싶은 강아지를 객체 p3을 생성, 필드의 값을 초기화 시키는 생성자를 통해서
		ex01_Puppy puppy3 = new ex01_Puppy("금색","댕댕이",4,"리트리버");
	
	}

		
}
