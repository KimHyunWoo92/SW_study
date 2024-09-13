package ex01_반복문;

public class ex04_369게임 {

	public static void main(String[] args) {
		for (int i=1; i<=50; i++) {
			if (i%3==0) {
				System.out.println("박수");
			}else if (i%5==0) {
				System.out.println("으악");
			}else {
				System.out.println(i);
			}
		}

	}

}
