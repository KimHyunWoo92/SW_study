package ex03_dowhile문;

import java.util.Random;
import java.util.Scanner;

public class ex05_숫자맞추기 {

	public static void main(String[] args) {
		
		Random ran = new Random();
		int ranNum = ran.nextInt(1,101);
		
		Scanner sc = new Scanner(System.in);
		int num = 0;
		do {
			System.out.print("1~100사이의 정수를 입력하세요 >>");
			num = sc.nextInt();
			
			if (num>ranNum) {
				System.out.println("더 작은 수로 다시 시도 해보세요");
			}else if (num<ranNum) {
				System.out.println("더 큰 수로 다시 시도 해보세요");
			}else {
				System.out.println(num+" 정답 입니다!!");
			}
		}while(num!=ranNum);
		sc.close();
	}

}
