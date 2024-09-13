package ex05_배열;

import java.util.Random;
import java.util.Arrays;

public class ex04_가장큰수찾기 {

	public static void main(String[] args) {
		
		Random ran = new Random();
		
		int[] numbers = new int[5];
		
		for (int i=0; i<numbers.length; i++) {
			numbers[i] = ran.nextInt(1,11);
		}
		System.out.println("배열 안에 들어있는 값 : "+Arrays.toString(numbers));
		System.out.println("가장 큰 값은 "+Math.max(numbers[0],numbers[4])+"입니다.");
	
	
		////
		
		int max = 0;
		for (int i=0; i<numbers.length; i++) {
			numbers[i] = ran.nextInt(1,11);
			
		}
		for (int i=0; i<numbers.length; i++) {
			if (max >= numbers[i]) {
				max = max;
			}else {
				max = numbers[i];
			}
		}System.out.println("배열 안에 들어있는 값 : "+Arrays.toString(numbers));
		System.out.println("가장 큰 값은 "+max+"입니다");
			
	
	
	
	
	
	}

}
