package ex05_배열;

public class ex02_배열기초 {

	public static void main(String[] args) {
		
		int[] numbers = new int[5];
		
		// 배열의 길이
		// 변수명.
		int leg = numbers.length;
		System.out.println("배열의 길이 : "+ leg);
		
		// 배열의 각 칸을 5의 배수로 초기화하세요.

		
		for (int i=1; i<=numbers.length; i++) {
			numbers[i-1] = (5*i);
		}
		// 배열의 값을 전부 출력
		for (int i=0; i<numbers.length; i++) {
			System.out.print(numbers[i]+"\t");
		}
		
		// 배열을 생성함과 동시에 데이터를 집어넣는 방법
		String[] names = {"이도연","이주희","정봉균"};
		
		//이주희 데이터를 출력하기
		System.out.println(names[1]);
		
		

	}

}
