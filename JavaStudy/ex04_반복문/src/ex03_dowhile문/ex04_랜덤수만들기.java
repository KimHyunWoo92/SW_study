package ex03_dowhile문;

import java.util.Random;

public class ex04_랜덤수만들기 {

	public static void main(String[] args) {
		
		/*
		 
		 랜덤 수를 뽑아내는 방법
		 1. 랜덤한 수를 추출해오는 도구 꺼내기
		 2. 랜덤한 수 생성하기
		 
		 
		 */
		Random ran = new Random();
		
		//int ranNum = ran.nextInt(9)+1;
		int ranNum = ran.nextInt(1,10);
		System.out.print(ranNum+" ");
		
	}

}
