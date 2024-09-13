package ex03_자판기프로그램;

import java.util.Scanner;

public class ex02_자판기프로그램2 {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		
		System.out.println("금액을 입력하세요.");
		int money = sc.nextInt();
		
		System.out.println("메뉴를 고르세요.");
		System.out.print("1.아우터(700원) 2.이구동성(1000원) 3. 에그몽(500원) >> ");
		int menu = sc.nextInt();
		
		int change = 0;
		
		if (menu == 1) {
			change = (money-700);
			if (change <0) {
				System.out.println("돈이 부족해요ㅜㅜ");
				System.out.println("잔돈 : "+money+"원");
			}else {
				System.out.println("잔돈 : "+ change+"원");
			}
		}else if (menu == 2) {
			change = (money - 1000);
			if (change < 0) {
				System.out.println("돈이 부족해요ㅠㅠ");
				System.out.println("잔돈 : "+money+"원");
			}else {
				System.out.println("잔돈 "+change+"원");
			}
		}else if (menu ==3) {
			change = (money-500);
			if (change < 0) {
				System.out.println("돈이 부족해요ㅠㅠ");
				System.out.println("잔돈 : "+money+"원" );
			}else{
				System.out.println("잔돈 : "+change+"원");
			}
		}
		sc.close();

	}

}
