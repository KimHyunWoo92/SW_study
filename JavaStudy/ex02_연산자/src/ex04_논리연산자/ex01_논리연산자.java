package ex04_논리연산자;

public class ex01_논리연산자 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		// 논리연산자
		// : 논리 결과를 판단할 때 사용
		
		int a = 3;
		int b = 10;
		System.out.println(!(a>b));
		
		// ! : not
		// == : 같다
		
		System.out.println((a<b)&&(a==b));
		// &&(and) : 둘 다 True 이면 true 결과가 나옴
		
		System.out.println((a!=b)||(a>b));
		
		// Q :
	}

}
