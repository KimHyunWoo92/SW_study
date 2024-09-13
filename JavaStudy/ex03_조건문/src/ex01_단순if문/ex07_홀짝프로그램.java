package ex01_단순if문;

import java.util.Scanner;

public class ex07_홀짝프로그램 {

	public static void main(String[] args) {
		
		// 사용자로부터 숫자를 입력받아서 해당하는 숫자가
		// 0 인지, 홀숭딘지, 짝수인지 판단하는 프로그램
		
		Scanner sc = new Scanner(System.in);
		
		System.out.print("숫자를 입력하세요 >> ");
		int num = sc.nextInt();
		
		// 3. 조건을 판단 0인지, 홀수인지, 짝수인지
		if (num == 0) {
			System.out.println("0입니다.");
		}else if (num%2==0) {
			System.out.println("짝수입니다.");
		}else {
			System.out.println("홀수입니다.");
		}
		sc.close();
	}

}
