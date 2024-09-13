package ex05_배열;


import java.util.Random;

public class ex06_로또번호추첨 {

	public static void main(String[] args) {
		
		Random ran = new Random();
		
		int[] lotto = new int[5];
		
		
		System.out.println("====로또타임====");
		System.out.println("이번주 출력번호는요...!!! 두구두구두구!!!!");
		
		for (int i=0; i<lotto.length; i++) {
			lotto[i] = ran.nextInt(1,11);
			for (int j=0; j<i; j++) {
				if (lotto[i] == lotto[j]) {
					i--;
				}	
			}
		}
		for (int i=0; i<lotto.length; i++) {
			System.out.print(lotto[i]+" ");
		}
		
		
		

	}

}
