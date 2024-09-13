package Model;

public class MemberDTO {
	// Model 역할
	// DTO : Data Transfer Object(데이터를 변환할 수 있는 객체) --> getter/setter 메소드
	
	private String id;
	private String pw;
	private String name;
	private int age;
	private int score;
	private int val;
	
	
	
	

	public MemberDTO(String id, String pw) {
		
		this.id = id;
		this.pw = pw;
	}

	public MemberDTO(String id, String pw, String name, int age, int score) {
		
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.age = age;
		this.score = score;
	}
	
	public MemberDTO(String id, String name, int age, int score) {
		
		this.id = id;
		this.name = name;
		this.age = age;
		this.score = score;
	}
	
	public MemberDTO(int val, String id, String pw) {
		
		this.val = val;
		this.id = id;
		this.pw = pw;
	}

	public int getVal() {
		return val;
	}

	public void setVal(int val) {
		this.val = val;
	}

	// Getter/Setter
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
