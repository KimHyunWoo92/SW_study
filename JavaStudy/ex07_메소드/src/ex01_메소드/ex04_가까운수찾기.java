package ex01_메소드;

import java.util.Scanner;

public class ex04_가까운수찾기 {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		
		System.out.print("정수 입력1 : ");
		int num1 = sc.nextInt();
		
		System.out.print("정수 입력2 : ");
		int num2 = sc.nextInt();
		
		int result = close10(num1,num2);
		System.out.println("10에 가까운수 : "+result);
		sc.close();
		
	}
	
	public static int close10(int n1, int n2) {
		int target = 10;
		int result = 0;
		
		if (Math.abs(target-n1) < Math.abs(target-n2)) {
			result = n1;
		}else if (Math.abs(target-n1)>Math.abs(target-n2)) {
			result = n2;
		}else {
			result = 0;
		}
		return result;
	}
}
