package ex01_메소드;

public class ex01_메소드 {

	public static void main(String[] args) {
		
		// 메소드 사용하기(main영역안쪽에서 사용해야한다.)
		System.out.println(addDouble(3.14,4.2));
		
		
		System.out.println(subNum(8,8));
		
		printHello();
	}
	
	/*
	 메소드 생성(main 영역을 벗어나서 작성)
	 1. 더하기
	 리턴타입 : double / 메소드명 : addDouble / 매게변수 : double 2개
	 
	 */
	public static double addDouble(double n1, double n2) {
		double result = n1+n2;
		return result;
		// return : 최종적으로 반환할 값
	}
	
	// 빼기
	// 리턴타입 : int / 메소드명 : subNum / 매개변수 : int 2개
	// 매개변수로 받아온 데이터 두개를 뺀 결과값을 돌려주는 메소드,
	// 단 큰수에서 작은수를 뺀 결과 필요
	public static int subNum(int n1, int n2) {
		
		int result = 0;
		if(n1>=n2) {
			result = n1-n2;
			
		}else {
			result = n2-n1;
			
		}
		return result;
	}	
	
	
	// 3. Hello World를 출력하는 메소드
	public static void printHello() {
		// void : return 타입이 없음을 의미하는 키워드
		System.out.println("Hello World");
	}
	
	
	
	
	
	
	
	
}
