package 포켓몬;

public class Pocketmon {
	// 포켓몬 게임에 필요한 설계도
	// 1. 필드
	
	private String name;
	private String type;
	private int hp;  // hp : health point
	private int atk; // attack : 공격력
	private String skill;
	
	// 생성자
	// 객체 생성과 더불어 모든 필드의 값을 초기화 시키는 생성자
	public Pocketmon(String name, String type, int hp, int atk, String skill) {
		this.name = name;
		this.type = type;
		this.hp = hp;
		this.atk = atk;
		this.skill = skill;
	}
	

	// 2. 메서드
	//    : 각 필드들의 값을 확인하는 getter, 변경하는 setter 메서드 
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	// getter/setter 단축기 alt+shift+s 
	public String getType() {
		return type;
	}
	
	public void setType(String type) {
		this.type = type;
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
	public String getSkill() {
		return skill;
	}
	public void setSkill(String skill) {
		this.skill = skill;
	}
	
	
	
	
	
}	
