package ex03_dowhile문;

import java.util.Scanner;

public class ex03_몸무게관리프로그램 {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		
		
		System.out.print("현재 몸무게 : ");
		int weight = sc.nextInt();
		
		System.out.print("목표 몸무게 : ");
		int target = sc.nextInt();
		int count = 1;
		
		do {			
			System.out.print(count+"주자 감량몸무게 : ");
			int disweight = sc.nextInt();
			count++;
			weight -= disweight;
			
		}while(weight>=target);
		System.out.print(weight+"kg 달성!! 축하합니다!!");
		sc.close();

	}

}
