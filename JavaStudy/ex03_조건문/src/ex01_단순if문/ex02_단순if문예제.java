package ex01_단순if문;

import java.util.Scanner;

public class ex02_단순if문예제 {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		
		System.out.print("정수를 입력하세요 : ");
		int num = sc.nextInt() ;
		
		if (num%3 == 0 && num%5 == 0) {
			System.out.println("3과 5의 배수입니다.");
		}
		else {
			System.out.println("3과 5의 배수가 아닙니다.");
		}
		// 다른풀이
		
		if(num % 3 == 0) {
			//3의 배수이다.
			if (num % 5 == 0) {
				System.out.println();
			}
		}
		sc.close();
	}

}
