package 포켓몬;

import java.util.Scanner;

public class Pocketmon_main {

	public static void main(String[] args) {
		// 설계도 실행하는 곳
		// 게임 실행 공간
		// 1)포켓몬 2마리 생성
		Scanner sc = new Scanner(System.in);
		
		Pocketmon lizamon = new Pocketmon("리자몽", "불",100, 30, "파괴광선");
		Pocketmon pikachu = new Pocketmon("피카츄", "전기",100, 15, "백만볼트");
		
		while(true) {
			System.out.println("==== 포켓몬을 선택하세요 ====");
			System.out.print("[1]리자몽 [2] 피카츄 >> ");
			int choice = sc.nextInt();
			if (choice==1) {
				//사용자가 리자몽을 선택
				System.out.println("리자몽 선택");
				//리자몽이 피카츄를 공격
				System.out.println("=====공격을 선택하세요=====");
				System.out.println("[1]일반공격  [2]스킬공격");
				int choiceAtk = sc.nextInt();
				if (choiceAtk == 1) {
					// 일반공격 선택했다면
					System.out.println("일반공격 선택");
					// 피카츄의 hp를 리자몽의 공격력만큼 감소
					pikachu.setHp(pikachu.getHp()-lizamon.getAtk());
				}else {
					// 2)스킬공격을 선택했다면
					System.out.println("스킬공격 선택");
					//	 피카츄의 hp를 리자몽 공격의 1.5배만큼 감소
					pikachu.setHp(pikachu.getHp()-(lizamon.getAtk()+lizamon.getAtk()/2));
				}
				// 3) 두마리 포켓몬의 hp를 출력
				System.out.println("=== 남은 hp ====");
				System.out.println("리자몽의 남은 hp : "+lizamon.getHp());
				System.out.println("피카츄의 남은 hp : "+pikachu.getHp());
			}else if(choice == 2) {
				//사용자가 피카츄을 선택
				System.out.println("피카츄 선택");
				//피카츄가 리자몽를 공격
				System.out.println("=====공격을 선택하세요=====");
				System.out.println("[1]일반공격  [2]스킬공격");
				int choiceAtk = sc.nextInt();
				if (choiceAtk == 1) {
					// 일반공격 선택했다면
					System.out.println("일반공격 선택");
					// 리자몽의 hp를 피카츄의 공격력만큼 감소
					lizamon.setHp(lizamon.getHp()-pikachu.getAtk());
				}else {
					// 2)스킬공격을 선택했다면
					System.out.println("스킬 공격 선택");
					//	 리자몽의 hp를 피카츄 공격의 1.5배만큼 감소
					lizamon.setHp(lizamon.getHp()-(pikachu.getAtk()+pikachu.getAtk()/2));
				}
				// 3) 두마리 포켓몬의 hp를 출력
				System.out.println("=== 남은 hp ====");
				System.out.println("리자몽의 남은 hp : "+lizamon.getHp());
				System.out.println("피카츄의 남은 hp : "+pikachu.getHp());
			}else {
				System.out.println("다시 포켓몬을 선택하세요.");
			}
			// 포캣몬 선택 ~ 공격 선택하는 것까지 반복
			// 두마리의 포켓몬 중에서 한마리라도 hp가 0보다 작거나 같았을때 프로그램 종료.
			// 누가 이겼는지도 출력
			if (lizamon.getHp()<= 0 | pikachu.getHp()<= 0) {
				if(lizamon.getHp()>pikachu.getHp()) {
					System.out.println("리자몽 승리");
					break;
				}else {
					System.out.println("피카츄 승리");
					break;
				}	
			}
		}

	}

}
