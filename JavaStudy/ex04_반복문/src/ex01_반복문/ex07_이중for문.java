package ex01_반복문;

public class ex07_이중for문 {

	public static void main(String[] args) {
		
		/*
		 이중 for문
		 	: for 문안에 for 문이 들어가 있는 형태
		 	for(int i=1; i<=5; i++ {
		 		for (int j=i; j<=5; i++ {
		 		}
		 	}
		 */
		for (int i=1; i<=4; i++) {
			System.out.print(i+" ");
			for (int j=1; j<=3; j++) {
				System.out.print(j+" ");
			}
			System.out.println();
		}
		
		
	}

}
