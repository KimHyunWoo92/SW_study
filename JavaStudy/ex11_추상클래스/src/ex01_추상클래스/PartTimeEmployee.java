package ex01_추상클래스;

public class PartTimeEmployee extends Employee {
	

	int workDay;
	

	public PartTimeEmployee(String empno, String name, int pay, int workDay) {
		super(empno,name,pay);
		this.workDay = workDay;
	}
	
	public int getMoneyPay() {
		return pay*workDay;
	}
	
	
	
}
