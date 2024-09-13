package ex02_인터페이스;

import ex01_추상클래스.Employee;

public class Child extends Employee implements Temp, Temp2{

	public Child(String empno, String name, int pay) {
		super(empno, name, pay);
		// TODO Auto-generated constructor stub
	}

	@Override
	public void temp() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int getMoneyPay() {
		// TODO Auto-generated method stub
		return 0;
	}

}
