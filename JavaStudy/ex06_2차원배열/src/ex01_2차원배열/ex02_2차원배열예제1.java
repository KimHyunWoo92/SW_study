package ex01_2차원배열;

public class ex02_2차원배열예제1 {

	public static void main(String[] args) {
		
		int[][] array = new int[5][5];
		
		int num =1;
		for (int i=0; i<5; i++) {
			for (int j=0; j<5; j++) {
				array[i][j] = num;
				num++;
				System.out.print(array[i][j]+"\t");
			}System.out.println();
		}

	}

}
