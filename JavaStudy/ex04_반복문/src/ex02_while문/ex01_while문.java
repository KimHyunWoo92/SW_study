package ex02_while문;

import java.util.Scanner;

public class ex01_while문 {

	public static void main(String[] args) {
		/*
		 while 문을 사용아여 키보드로부터 입력 받은 수가 10보다 작을 때만 정수 입력
		  : 10보다 큰수를 입력하면 "종료되었습니다"를 출력
		 while(조건식){
		 	실행문장
		 }
		 while문 : 반복횟수가 정확하게 정해지지 않은 경우에 사용
		 */
		
		Scanner sc = new Scanner(System.in);
		
		
		while(true) {
			System.out.print("정수 입력 : ");
			int num = sc.nextInt();
			
			if (num>10) {
				System.out.println("종료 되었습니다.");
				break;
			}
		}sc.close();
		
		
		
		}
	}


