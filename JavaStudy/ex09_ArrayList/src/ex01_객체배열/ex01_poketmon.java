package ex01_객체배열;

public class ex01_poketmon {
	
	//1.필드
	// 이름, 타입, 스킬, hp, atk
	private String name;
	private String type;
	private String Skill;
	private int hp;
	private int atk;
	
	// 2.메소드
	// getter/setter 필드 전부 생성하기
	// 모든 필드의 값을 초기화 할 수 있는 생성자 만들기
	
	
	
	public ex01_poketmon(String name, String type, String Skill, int hp, int atk) {
		this.name = name;
		this.type = type;
		this.Skill = Skill;
		this.hp = hp;
		this.atk = atk;
	}
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getSkill() {
		return Skill;
	}
	public void setSkill(String skill) {
		Skill = skill;
	}
	public int getHp() {
		return hp;
	}
	public void setHp(int hp) {
		this.hp = hp;
	}
	public int getAtk() {
		return atk;
	}
	public void setAtk(int atk) {
		this.atk = atk;
	}
	
	
	
	
	
}
