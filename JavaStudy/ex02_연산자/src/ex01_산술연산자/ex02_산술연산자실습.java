package ex01_산술연산자;

import java.util.Scanner;

public class ex02_산술연산자실습 {

	public static void main(String[] args) {
		
		// Q : 2개의 정수를 입력받아 두 수의 더하기, 빼기, 곱하기, 나누기(몫)의
		//	   결과값을 출력하세요.
		
		// 1. 입력받을 도구 가져오기
		Scanner sc = new Scanner(System.in);
		// 2. 사용자에게 "첫번째 정수 입력:" 문구 출력
		// println : 출력후,개행
		System.out.print("첫번째 정수 입력: ");
		// 사용자에게 값을 입력받아서 변수 num1에 저장
		int num1 = sc.nextInt();
		// System.out.println(num1);
		// 사용자에게 "두번째 정수 입력:" 문구 출력
		System.out.print("두번째 정수 입력: ");
		int num2 = sc.nextInt();
		// System.out.println(num2);
		
		System.out.println("두 수의 더하기: " + (num1+num2));
		System.out.println("두 수의 빼기 : " + (num1-num2));
		System.out.println("두 수의 곱하기 : " + (num1*num2));
		System.out.println(("두 수의 나누기(몫) : " + (num1/num2)));
		sc.close();
		
		
		
		
	}

}
