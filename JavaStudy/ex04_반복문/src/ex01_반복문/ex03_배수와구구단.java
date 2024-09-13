package ex01_반복문;

public class ex03_배수와구구단 {

	public static void main(String[] args) {
		//문제2 개행없이 출력
		for (int i=1; i<=100; i++) {
			if (i%3==0 && i%5==0) {
				System.out.print(i+" ");
			}
		}
		System.out.println();
		//문제3 구구단2단 출력
		for (int j=1; j<=9; j++) {
			System.out.println(j+"*2 = "+j*2);
		}
	}

}
