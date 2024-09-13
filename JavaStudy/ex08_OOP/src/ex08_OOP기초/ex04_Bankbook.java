package ex08_OOP기초;

public class ex04_Bankbook {
	// 은행 프로그램을 만든다고 가정
	// 통장 정보를 저장할 수 있는 우리만의 자료형 설계도면

	// 1. Field(Data,속성)
	// 잔액(money)
	private int money;

	// 이름(name)
	private String name;

	// 2. Method(Logic, 기능, 행위)
	// 1) 입금하다(deposit)
	// return 타입없이 매개변수로 정수형을 하나 받아오기
	public void deposit(int money) {
		this.money += money;
		System.out.println("입금 : " + money + "원");
	}

	// 2) 출금하다(withdraw)
	// return 타입없음. 매개변수로 정수형 하나 받아오기
	public void withdraw(int money) {
		if (this.money < money) {
			System.out.println("잔액이 부족합니다.");
		} else {
			this.money -= money;
			System.out.println("출금 : " + money + "원");
		}

	}

	// 3) 잔액확인하기(showMoney)
	// --> return type있음. int형태를 되돌려주기
	// 매개변수는 없음. 현재 잔액을 리턴

	public int showMoney() {
		return money;
	}

}
