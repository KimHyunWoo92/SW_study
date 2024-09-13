package ex01_단순if문;

import java.util.Scanner;

public class ex06_다중if문 {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		
		System.out.print("점수 입력 : ");
		int totalScore = sc.nextInt();
		
		if (totalScore >= 90) {
			System.out.println("A학점입니다!");
		}else if (totalScore >= 80) {
			System.out.println("B학점입니다!");
		}else if (totalScore >= 70) {
			System.out.println("C학점입니다!");
		}else {
			System.out.println("D학점입니다!");
		}
		sc.close();
	}

}
