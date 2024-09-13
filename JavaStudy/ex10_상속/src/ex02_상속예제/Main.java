package ex02_상속예제;

public class Main {

	public static void main(String[] args) {
		
		// Mario
		// -> .start() : 마리오 게임 시작
		// Animal
		// -> .start() : 동물의 숲 게임 시작
		Mario mario = new Mario();
		mario.start();
		
		Animal animal = new Animal();
		animal.start();
		
		
		play(new Mario());
		play(new Animal());
		
		// 추상클래스는 맥세 애성이 불가능하다
//		MarioKart mk = new MarioKart();
		
		
		

		
		
		
		
	}
	
	public static void play(Game a) {
		a.start();
	}
}
