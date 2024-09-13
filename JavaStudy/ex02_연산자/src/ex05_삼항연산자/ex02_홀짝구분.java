package ex05_삼항연산자;

import java.util.Scanner;

public class ex02_홀짝구분 {

	public static void main(String[] args) {
		
		// 홀짝 구분
		Scanner sc = new Scanner(System.in);
		
		System.out.print("정수를 입력하세요 : ");
		
		int num1 = sc.nextInt();
		System.out.println(num1+"는(은)"+(num1%2==0? "짝수입니다":"홀수입니다."));
		
		sc.close();
		
		
		
		
		
		

	}

}
