package ex01_메소드;

public class ex05_완전수구하기 {

	public static void main(String[] args) {
		
		// 약수 구하기
//		Scanner sc = new Scanner(System.in);
//		
//		System.out.print("num1 입력 : ");
//		int num1 = sc.nextInt();
//		
//		System.out.print("num2 입력 : ");
//		int num2 = sc.nextInt();
//		
//		boolean divisor = isDivisor(num1,num2);
//		System.out.println(divisor);
		
		// 약수의 합 구하기
//		System.out.println(getSum(7));
		
		// 완전수 구하기
		System.out.println(isPerfect(28));
	}

	
	// 약수구하기
//	public static boolean isDivisor(int n1, int n2) {
//		
//		boolean result = false;
//		if (n1%n2==0) {
//			result = true;
//		}		
//		
//		return result;
	
	//약수의 합 구하기
	
//	private static int getSum(int n1) {
//		int num = 0;
//		for (int i=1; i<n1; i++) {
//			if (n1%i ==0) {
//				num+=i;
//			}
//		}
//		return num;
	
	
	private static boolean isPerfect(int n1) {
		int num = 0;
		boolean result = false;
		
		for (int i=1; i<n1; i++) {
			if (n1%i==0) {
				num += i;
			}
		}
		if (num == n1) {
			result = true;
		}else {
			num = 0;
		}
		return result;
	}
	
}	
	
	

