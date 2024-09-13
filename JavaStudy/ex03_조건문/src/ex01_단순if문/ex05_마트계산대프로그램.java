package ex01_단순if문;

import java.util.Scanner;

public class ex05_마트계산대프로그램 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		int price = 10000;
		System.out.print("상품의 개수를 입력하세요 : ");
		int items = sc.nextInt();
		
		int pay = 0;
		if (items >=11) {
			pay = (int) (price*items*0.9);
		}else { pay = (price*items);
		}
		
		System.out.println("가격은 "+pay+"입니다.");
		sc.close();
	}

}
