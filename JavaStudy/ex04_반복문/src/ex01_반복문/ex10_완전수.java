package ex01_반복문;

public class ex10_완전수 {

	public static void main(String[] args) {
		
		int num = 0;
		for (int i=1; i<=1000; i++) {
			num = 0;
			for (int j=1; j<i; j
					++) {
				if (i%j==0) {
					num += j;
				}
			}
			if (num==i) {
				System.out.print(i+" ");
				
			}
		}

	}

}
