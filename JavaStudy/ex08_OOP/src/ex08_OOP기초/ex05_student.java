package ex08_OOP기초;

public class ex05_student {
	
	// 1.Field
	private String name;
	private String number;
	private int age;
	private int scoreJava;
	private int scoreWeb;
	private int scoreAndroid;
	
	public ex05_student(String name, String number, int age) {
		this.name = name;
		this.number = number;
		this.age = age;
	}
	// 오버로딩이란?
	// 메소드의 이름과 리턴타입이 동일한 상태에서
	// 매게변수의 개수와 타입을 다르게 지정하여 **중복으로 정의**하는 형태
	
	public ex05_student() {
	}
	
	// 2.getter/setter
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getScoreJava() {
		return scoreJava;
	}
	public void setScoreJava(int scoreJava) {
		this.scoreJava = scoreJava;
	}
	public int getScoreWeb() {
		return scoreWeb;
	}
	public void setScoreWeb(int scoreWeb) {
		this.scoreWeb = scoreWeb;
	}
	public int getScoreAndroid() {
		return scoreAndroid;
	}
	public void setScoreAndroid(int scoreAndroid) {
		this.scoreAndroid = scoreAndroid;
	}
	
	
	
	
	
	
}
