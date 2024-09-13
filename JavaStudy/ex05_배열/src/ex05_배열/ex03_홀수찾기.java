package ex05_배열;

import java.util.Random;

public class ex03_홀수찾기 {

	public static void main(String[] args) {
		
		Random ran = new Random();
		int count = 0;
		int[] numbers = new int[5];
		
		for (int i=0; i<numbers.length; i++) {
			numbers[i] = ran.nextInt(1,101);
			if (numbers[i]%3==0) {
				numbers[count] = numbers[i];
				count++;
				}
		}
		System.out.print("array에 들어있는 홀수는 ");
		for (int i=0; i<count; i++) {
			if (i>0) {
				System.out.print(", ");
			}
			System.out.print(numbers[i]);
		}
		
		System.out.println("이고, 총 "+count+"개 입니다.");
	}
	// 배열 안에 있는 모든 데이터 출력하기
	// Arrays.toString(배열명)
}
