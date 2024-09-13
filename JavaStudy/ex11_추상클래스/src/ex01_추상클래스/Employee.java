package ex01_추상클래스;

public abstract class Employee {
	
	// 1. 필드
	protected String empno;
	protected String name;
	protected int pay;
	
	public Employee(String empno, String name, int pay) {
		this.empno = empno;
		this.name = name;
		this.pay = pay;
	}
	
	public abstract int getMoneyPay();
	
	public String print() {
		return  empno+" / "+name+" / "+pay;
	}
	
	
	
	
	
	
	
}
