package ex01_2차원배열;

public class ex06_다이아몬드출력 {

	public static void main(String[] args) {
		
		int[][] array = new int[5][5];
		int center = array.length/2;
		int num = 1;
		
		for (int i=0; i<5; i++) {
			if (i<=center) {
				for (int j=center-i; j <= center+i; j++) {
					array[i][j] = num++;
				}
			}else {
				for (int j=i-center; j<array.length-(i-center); j++) {
					array[i][j] = num++;
				}
			}
		}
		
		for (int i = 0; i < array.length; i++) {
            for (int j = 0; j < array[i].length; j++) {
                System.out.print(array[i][j] + "\t");
            }
            System.out.println();
        }
		
		
		

	}

}
