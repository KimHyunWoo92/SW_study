package Question2;

public class TV {
	
	private String TV;
	private int year;
	private int inch;
	
	public TV(String TV, int year, int inch) {
		super();
		this.TV = TV;
		this.year = year;
		this.inch = inch;
	}
	
	public void show() {
		System.out.println(TV+"에서 만든 "+year+"년형 "+inch+"인치 TV");
	}
	
}
