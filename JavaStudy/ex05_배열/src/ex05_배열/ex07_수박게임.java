package ex05_배열;


import java.util.Scanner;

public class ex07_수박게임 {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		
		String[] word = {"수","박"};
		
		System.out.println("====수박 게임 start~!====");
		System.out.print("숫자를 입력하세요 : ");
		int num = sc.nextInt();
		
		
		for (int i=0; i<num; i++) {
			if (i%2==0) {
				System.out.print(word[0]);
			}else {
				System.out.print(word[1]);
			}
		}
		sc.close();
		

	}

}
