package ex01_메소드;

import java.util.Scanner;

public class ex02_계산기 {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		System.out.print("정수1 입력 : ");
		int num1 = sc.nextInt();
		
		System.out.print("정수2 입력 : ");
		int num2 = sc.nextInt();
		
		String op = sc.next();
		System.out.println(cal(num1,num2,op));
		sc.close();
	}
	
	
	/*
	 1. 정수형 num1과 num2를 입력받고, 문자형 op를 선언해 원하는 연산자를 넣으세요.
	 2. num1과 num2를 op에 맞게 연산하여 최종값을 반환해주는 cal 메소드를 만드세요.
	 */
	
	public static int cal(int n1,int n2,String op) {
		int result = 0;
		if (op.equals("+")) {
			result = n1 + n2;
		}else if (op.equals("-")) {
			if (n1>=n2) {
				result = n1 - n2;
			}else {
				result = n2 - n1;
			}
		}else if (op.equals("/")) {
			result = n1/n2;
		}else if (op.equals("*")) {
			result = n1*n2;
		}else if (op.equals("%")) {
			result = n1%n2;
		}else {
			System.out.println("연산이 불가능합니다.");
		}
		return result;
	}
	
	
	

}
