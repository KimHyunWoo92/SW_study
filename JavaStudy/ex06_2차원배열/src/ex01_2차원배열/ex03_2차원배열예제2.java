package ex01_2차원배열;

public class ex03_2차원배열예제2 {

	public static void main(String[] args) {
		
		int[][] array = new int[5][5];
		int num = 21;
		int num1 = 22;
		
		
		for (int i=0; i<5; i++) {
			for (int j=0; j<5; j++) {
				array[i][j] = num;
				num += 5;
				System.out.print(array[i][j]+"\t");
			}
			num = num1;
			num1++;
			System.out.println();
		}
		
	}

}
