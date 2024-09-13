package ex01_2차원배열;



public class ex01_2차원배열 {

	public static void main(String[] args) {
		/*
		 이차원 배열
		 	: 배열 안에 또 다른 배열이 존재하는 형태
		 	: 참조가 2번 일어나는 형태(참조의 참조)
		 	
		 1. 이차원 배열 선언방법
		 	자료형[][] 변수명 = new 자료형[행][열];
		 */
		
		int[][] array = new int[3][3];
//		System.out.println(array);
//		System.err.println(array[0]);
//		System.out.println(array[0][0]);
//		array[1][1] = 5;
//		System.out.println(array[1][1]);
		
		//이차원 배열에 값 넣기!(1~9)
		int num = 1;
		for (int i=0; i<3; i++) {
			for (int j=0; j<3; j++) {
				array[i][j] = num;
				num ++;
				System.out.print(array[i][j]+"\t");
			}System.out.println();	
		}
		
	}

}
