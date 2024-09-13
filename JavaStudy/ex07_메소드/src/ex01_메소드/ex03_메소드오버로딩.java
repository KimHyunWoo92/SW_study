package ex01_메소드;

public class ex03_메소드오버로딩 {

	public static void main(String[] args) {
		

	}
	
	// 메소드 오버로딩(=중복정의)
	// 메소드 오버로딩 성립 조건
	// 1. 이름이 같아야 한다.
	// 2. 매개변수의 개수, 혹은 자료형(데이터 타입)이 달라야한다.
	
	private static int add(int num1, int num2) {
		int result = 0;
		result = num1 + num2;
		return result;
	}
	
	private static double add(double num1, double num2) {
		double result = 0;
		result = num1 + num2;
		return result;
	}
	
	
}
