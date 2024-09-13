package ex01_산술연산자;

public class ex01_백의자리미만버리기 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 필요없는 코드 한줄 삭제 : ctrl d
		// 메인메서드 생성 체크 할때 : alt v
		
		// 산술 연선자
		// + - * % /
		
		int num1 = 3;
		int num2 = 5;
		
	// Q : 정수형 데이터 140이라는 값이 할당된 변수 num3만들기
		int num3 = 140;
		// 출력문 : sys0 ctrl space
		// 더하기
		// 실행 :  ctrl F11
		// 저장 : ctrl S
		
		System.out.println(num1 + num3);
		System.out.println(num3/num2);
		
		
		// Q : 변수 num의 값이 456 이라면 400이 되고, 111이라면 100이 되는
		//	   백의 자리 미만ㅇ르 버리는 코드를 작성해보세요.
		
		int num = 456;
		
		System.out.println(num/100*100);
		System.out.println(num -(num%100));
		System.out.println(num/100+"00");
		
	}

}
