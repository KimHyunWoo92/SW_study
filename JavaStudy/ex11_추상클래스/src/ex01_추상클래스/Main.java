package ex01_추상클래스;

public class Main {

	public static void main(String[] args) {
		
		// 실행하는 공간
		RegularEmployee regular = new RegularEmployee("0001", "김현우", 4000, 300);
		System.out.println(regular.print());
		System.out.println(regular.getMoneyPay());
		
		TempEmployee temp = new TempEmployee("0002", "서보경", 4000);
		System.out.println(temp.print());
		
		PartTimeEmployee part = new PartTimeEmployee("0003", "안현진", 50, 20);
		System.out.println(part.print());
		
		
	}

}
