package ex03_자판기프로그램;

import java.util.Scanner;

public class ex01_자판기프로그램 {

	public static void main(String[] args) {
		// 자판기 프만들기
		// 1. 입력받을 도구 가져오기
		Scanner sc = new Scanner(System.in);
		
		// 2. 사용자에게 문구 출력("금액을 입력하세요.")
		// 3. 입력받을 금액을 money라는 변수에 저장
		System.out.print("금액을 입력하세요 : ");
		int money  = sc.nextInt();
		
		// 4. 문구 출력 "메뉴를 고르세요"
		//	- 1.아우터(700원) 2.이구동성(1000원) 3. 에그몽(500원)
		// 5. 입력 받은 메뉴를 menu라는 변수에 저장
		System.out.println("메뉴를 고르세요.");
		System.out.print("1.아우터(700원) 2.이구동성(1000원) 3. 에그몽(500원) >> ");
		int menu = sc.nextInt();
		
		int change = 0;
		// 6. 조건문을 사용하여 잔돈을 계산 후, 잔돈을 change라는 변수에 저장
		if (menu == 1) {
			change = (money - 700);
			System.out.println("잔돈 : "+ change+"원");
		}else if (menu == 2){
			change = (money - 1000);
			System.out.println("잔돈 : "+ change+"원");
		}else if (menu == 3) {
			change = (money - 500);
			System.out.println("잔돈 : "+ change+"원");
		}else {
			System.out.println("해당 메뉴는 없습니다.");
		}
		sc.close();
	}

}
