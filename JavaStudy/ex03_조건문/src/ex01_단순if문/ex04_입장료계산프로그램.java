package ex01_단순if문;

import java.util.Scanner;

public class ex04_입장료계산프로그램 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		System.out.println("====에버랜드에 오신걸 환영합니다!====");
		
		System.out.print("나이를 입력하세요 : ");
		int age = sc.nextInt();
		
		System.out.print("인원수를 입력하세요 : ");
		int people = sc.nextInt();

		if (age >=20) {
			System.out.println("총"+5000*people+"입니다.");
		}else {System.out.println("총"+(2500*people)+"입니다.");}
		//
		// if문안에서 money를 선언하는 경우 지역변수로 인식되기 때문에 전역에서 사용불가
		// ** 지역변수(local variable) 
		// : {} 영역 안에서 선언된 변수는 {} 안에서만 사용 가능. 
		// int money = 0;
		// 따라서 if문안에서 money를 외부에서 선언.
		// if (age<20) {
		//		int money = (int) (5000 * people * 0.5);
		//					0.5가 double타입(8byte) int(4byte)로 변환이 안됨.
		//					따라서 (int)를 통해 강제 형변환
		//}
		// if (age <20) {
		// 		money = (int) (5000 * people * 0.5)
		// else {
		// 		money = 5000*people
		//}
		//
		sc.close();
	}

}
