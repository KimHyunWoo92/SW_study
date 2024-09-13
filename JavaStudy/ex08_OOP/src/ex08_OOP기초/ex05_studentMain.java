package ex08_OOP기초;

public class ex05_studentMain {

	public static void main(String[] args) {
		
		
		// 객체 생성
		ex05_student stu1 = new ex05_student();
		
		// stu1에 학생정보 저장
		stu1.setName("이도연");
		stu1.setNumber("20241111");
		stu1.setAge(20);
		stu1.setScoreJava(50);
		stu1.setScoreWeb(99);
		stu1.setScoreAndroid(77);
		
		System.out.println(stu1.getName());
		System.out.println(stu1.getNumber());
		
		// student 자료형 stu2 객체 생성
		ex05_student stu2 = new ex05_student();
		
		
		
	}

}
