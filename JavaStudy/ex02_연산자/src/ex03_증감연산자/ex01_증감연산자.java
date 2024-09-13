package ex03_증감연산자;

public class ex01_증감연산자 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		// 증감연산자
		// 변수에 저장된 값을 1 증가 혹은 감소
		// 위치에 따라 연산의 결과가 달라짐
		// ++ 변수, 변수 ++
		// -- 변수, 변수 --
		// 부호 변수 : 변수를 실행하기 전에 증감연산
		// 변수 부호 : 변수를 실행하고 나서 증감연산
		
		int num = 3;
		// 코드 한줄 복사 붙여넣기 : ctrl alt 방향키
		System.out.println(--num); //2
		System.out.println(num); //2
		System.out.println(num--); //2
		System.out.println(num); //1
		
		int num1 =5;
		System.out.println(num1++); //5
		System.out.println(num1); //6
		System.out.println(++num1); //7
		System.out.println(num1); //7
	}

}
