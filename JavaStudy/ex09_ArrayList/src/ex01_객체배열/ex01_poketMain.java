package ex01_객체배열;

public class ex01_poketMain {

	public static void main(String[] args) {
		
		// 1. 객체 배열 생성
		// 자료형[] 배열이름 = new 자료형[칸수];
		// 포켓몬 자료형 3개 보관할 수 있는 bag 배열 생성
		
		ex01_poketmon[] bag = new ex01_poketmon[3];
		
		
		// 객체 배령릐 0번인덱스에 들어있는 데이터를 출력
		System.out.println("bag의 0번방 출력 : "+bag[0]);
		
		// 2. 객체 배열의 0번 인덱스에 포켓몬을 넣어보자
		// 이름: 리자몽 / 타입 : 불/ 스킬 : 화명방사 / hp: 100 /atk : 30
		
		// bag 0번방 포켓몬 이름 출력
		bag[0] = new ex01_poketmon("리자몽","불","화염방사",100,30);
		
		System.out.println(bag[0].getName());
		
		// 3. bag의 1,2 인덱스에도 포켓몬 넣어주기
		// 1번인덱스 
		// 이름 : 피카츄 / 타입: 전기 / 스킬 :백만볼트 / hp:100 /atk :10
		bag[1] = new ex01_poketmon("피카츄","전기","백만볼트",100,10);
		
		// 2번 인덱스
		// 이름 : 마자용 / 타입 : 에스퍼 / 스킬 : 카운터 / hp:150 / atk 15
		bag[2] = new ex01_poketmon("마자용","에스퍼","카운터",150,15);
		
		// 4. 배열 안에 들어있는 포켓몬의 이름, 타입, hp를 전부 출력해주세요.
		// ==== 포켓몬 정보 출력 ====
		// 리자몽 불 100
		// 피카츄 전기 100
		// 마자용 에스퍼 150
		System.out.println("==== 포캣몬 정보 출력 ====");
		System.out.println("이름\t타입\thp");
		for (int i=0; i<3; i++) {
			
			System.out.println(bag[i].getName()+"\t"+bag[i].getType()+"\t"+bag[i].getHp());
		}
		// for-each문
		// : 배열과 같이 여러개의 데이터를 저장하는 자료구조와 함께 사용
		System.out.println();
		for(ex01_poketmon p:bag) {
			System.out.println(p.getName()+"\t"+p.getType()+"\t"+p.getHp());
		}

	}

	
}
