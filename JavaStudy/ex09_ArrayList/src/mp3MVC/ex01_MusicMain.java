package mp3MVC;

import java.util.ArrayList;
import java.util.Random;
import java.util.Scanner;

import javazoom.jl.player.MP3Player;

public class ex01_MusicMain {
	// View : 사용자에게 보여지는 화면
	
	
	public static void main(String[] args) {
		
		/*
		 1. 기능정의
		 	: 재생(정보 출력), 정지, 다음곡, 이전곡, 셔블(랜덤)
		 
		 2. 노래 정보
		 	: 가수(artist), 제목(title), 길이(length), 경로(path)
		 	  를 저장할 수 있는 Music Class를 만들어 보자.
		 
		 */
		
		MP3Player mp3 = new MP3Player();
		String path = "C:\\Users\\SMHRD\\Desktop\\JavaStudy\\ex09_ArrayList\\mp3player\\";
		
		ex01_Music bubble = new ex01_Music("뉴진스","Bubble Gum","03:16",path+"Bubble Gum.mp3");
		
		// ArrayList를 이용해서 여러개의 Music을 하나로 묶기
		ArrayList<ex01_Music> list = new ArrayList<ex01_Music>();
		
		list.add(bubble);
		
		
		list.add(new ex01_Music("ZICO","SPOT!","02:47",path+"SPOT!.mp3"));
		list.add(new ex01_Music("에스파","Supernova","02:59",path+"Supernova.mp3"));
		list.add(new ex01_Music("QWER","고민중독","02:55",path+"고민중독.mp3"));
		list.add(new ex01_Music("아이브","해야","03:09",path+"해야(HEYA).mp3"));
		
		
		
		// 3. MP3 만들기
		// - (1) 메뉴를 출력하고, 사용자가 번호를 선택하는 틀 만들기
		// [1] 재생 [2]정지 [3]다음곡 [4]이전곡 [5]랜덤 [6]종료
		// 사용자가 종료를 선택할때까지 반복
		int idx = 0;
		
		Scanner sc = new Scanner(System.in);
		// 노래 재생을 담당하는 Controller 생성
		ex01_MusicController con = new ex01_MusicController();
		
		while (true) {
			System.out.println("[1] 재생 [2]정지 [3]다음곡 [4]이전곡 [5]랜덤 [6]종료");
			System.out.print("메뉴 선택 : ");
			int menu = sc.nextInt();
			
			if (menu ==1) {
				// 재생				
//				for (int i=0; i<list.size(); i++) {
//					System.out.println((i+1)+". "+list.get(i).getTitle());
//				}
//				System.out.print("노래 선택 : ");
//				int sing = sc.nextInt();
//				idx = sing;
				// 노래 재생중 노래가 겹치는일을 방지
				ex01_Music m = con.play();			
				System.out.println(m.getTitle()+"~~~재생중");
				System.out.println("가수 : "+m.getArtist());
				System.out.println("길이 : "+m.getLength());
				
				/*
				
				강사님 방식
				
				ex01_Music music = list.get(idx);
				
				mp3.play(music.getPath());
				System.out.println(music.getTitle()+"~~~재생중");
				System.out.println("가수 : "+music.getArtist());
				System.out.println("길이 : "+music.getLength());
				*/
				
			}
			
			else if (menu ==2) {
				// 정지
				// 1. 노래가 재생중인지 여부를 판단.
				if (con.stop()) {
					System.out.println("재생을 정지합니다.");
				}else {
					System.out.println("재생중인 노래가 없습니다.");
				}
				// 2. 노래가 재생중이 아니라면 재생중인 노래가 없습니다.
				
			}
			else if (menu ==3) {
				
				ex01_Music nextm = con.nextplay();
					
				System.out.println(nextm.getTitle()+"~~~재생중");
				System.out.println("가수 : "+nextm.getArtist());
				System.out.println("길이 : "+nextm.getLength());
				
			}
			else if (menu ==4) {
				// 이전곡
				
				ex01_Music prem = con.preplay();
						
				System.out.println(prem.getTitle()+"~~~재생중");
				System.out.println("가수 : "+prem.getArtist());
				System.out.println("길이 : "+prem.getLength());
				
				
			}
			else if (menu ==5) {
				
				ex01_Music ranm = con.ranplay();
						
				System.out.println(ranm.getTitle()+"~~~재생중");
				System.out.println("가수 : "+ranm.getArtist());
				System.out.println("길이 : "+ranm.getLength());
			}
			
			else if (menu == 6) {
				System.out.println("종료합니다.");
				if (mp3.isPlaying()) {
					mp3.stop();
				}
				break;
			}
			else {
				System.out.println("메뉴를 다시 선택해 주세요.");
			}
		}
		
		
	}

}
