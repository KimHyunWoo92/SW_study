package ex01_2차원배열;

public class ex04_2차원배열예제3 {

	public static void main(String[] args) {
		
		int [][] array = new int[5][5];
		
		int num = 21;
		
		for (int i=0; i<5; i++) {
			for (int j=0; j<5; j++) {
				if (i%2==0) {
					array[i][j] = num;
					num+=1;
				}else {
					array[i][array.length-j-1] = num;
					num+=1;
				}
				
			}
			
		}
		
		for (int i = 0; i < 5; i++) {
		    for (int j = 0; j < 5; j++) {
		        System.out.print(array[i][j] + "\t");
		    }
		    System.out.println();
		}
		
		
		// 앞선 예제처럼 if문 else문에 print를 사용하는경우, array[1][0]과 [1][1]은
		// 0, 0값으로 출력됨. 이는 int의 초기화 값이 0이며, [1][0]과[1][1]에 값이 들어가기전에
		// 출력문이 실행됨으로써 초기화값을 보여줌.
		// 즉 0, 0 값이 들어가고 28 27 26으로 출력됨.
		
		
		System.out.println();
		
		int num1 = 21;
		
		for (int i=0; i<5; i++) {
			if (i%2==0) {
				for (int j=0; j<5; j++) {
					array[i][j] = num1++;
					
				}
			}else {
				for (int j=4; j>-1; j--) {
					array[i][j] = num1++;
					
				}
			}
		}
		
		for (int i = 0; i < 5; i++) {
		    for (int j = 0; j < 5; j++) {
		        System.out.print(array[i][j] + "\t");
		    }
		    System.out.println();
		}
	}

}
