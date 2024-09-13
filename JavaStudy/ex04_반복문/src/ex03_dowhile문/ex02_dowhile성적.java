package ex03_dowhile문;

import java.util.Scanner;

public class ex02_dowhile성적 {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		int count = 0;
		int sum = 0;
		int num = 0;
		do {
			System.out.println("숫자를 입력하세요");
			int num1 = sc.nextInt();
			num = num1;
			if (num<=100) {
			sum += num;
			count++;
			}
			
		}while(num<100);
		System.out.println("합계 : "+sum);
		System.out.println("횟수 : "+count);
		System.out.println("평균 : "+((float)sum/count));
		sc.close();
	}

}
