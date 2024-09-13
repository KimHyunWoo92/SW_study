package ex01_반복문;

import java.util.Scanner;

public class ex05_단범위입력 {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		
		System.out.print("단 입력: ");
		int dan = sc.nextInt();
		
		int range = sc.nextInt();
		for (int i =1; i<=range; i++) {
			System.out.println(dan+"*"+i+"="+dan*i);
		}sc.close();
	}

}
