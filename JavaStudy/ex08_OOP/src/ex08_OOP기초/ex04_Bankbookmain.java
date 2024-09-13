package ex08_OOP기초;

public class ex04_Bankbookmain {

	public static void main(String[] args) {
		
		// 1. Bankbook 설계도면을 기반으로 bank1 객체 생성
		ex04_Bankbook bank1 = new ex04_Bankbook();
		
		// 2.bank1에 8000원 입금
		bank1.deposit(8000);
		
		// 3.bank1에 5000원 출금
		bank1.withdraw(10000);
		
		// 4.bank1의 잔액을 출력
		int money = bank1.showMoney();
		System.out.println("잔액 : "+money+"원");
		
	}

}
