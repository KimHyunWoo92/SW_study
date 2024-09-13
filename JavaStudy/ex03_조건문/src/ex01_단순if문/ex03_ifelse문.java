package ex01_단순if문;

import java.util.Scanner;

public class ex03_ifelse문 {

	public static void main(String[] args) {
		
		// 1.입력도구 꺼내오기
		Scanner sc = new Scanner(System.in);
		
		// 2. 정수 입력받기
		System.out.print("점수를 입력하세요 : ");
		int grade = sc.nextInt();
		
		// 3. 60점 이상인지 조건 판별
		if(grade >= 60) {
			System.out.println("합격입니다.");
		} else {
			System.out.println("불합격입니다.");
		}
		sc.close();
	}

}
