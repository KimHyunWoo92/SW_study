package ex05_삼항연산자;

import java.util.Scanner;

public class ex03_큰수작은수빼기 {

	public static void main(String[] args) {
		// Q : 2개의 정수를 입력받아 큰 수에서 작은 수를 뺀 결과값을 구하시오.
		Scanner sc = new Scanner(System.in);
		
		System.out.print("첫번째 정수 입력: ");
		int num1 = sc.nextInt();
				
		System.out.print("두번째 정수 입력: ");
		int num2 = sc.nextInt();
				
		System.out.println("두 수의 차: "+ (num1>num2? num1-num2:num2-num1));
		
		sc.close();
		
		
		

	}

}
