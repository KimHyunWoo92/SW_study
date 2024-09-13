package mp3player;

import java.util.ArrayList;
import java.util.Random;
import java.util.Scanner;

import javazoom.jl.player.MP3Player;

public class ex01_mp3main {

	public static void main(String[] args) {
		
		/*
		 1. 기능정의
		 	: 재생(정보 출력), 정지, 다음곡, 이전곡, 셔블(랜덤)
		 
		 2. 노래 정보
		 	: 가수(artist), 제목(title), 길이(length), 경로(path)
		 	  를 저장할 수 있는 Music Class를 만들어 보자.
		 
		 */
		Scanner sc = new Scanner(System.in);
		
		
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
		
		while (true) {
			System.out.println("[1] 재생 [2]정지 [3]다음곡 [4]이전곡 [5]랜덤 [6]종료");
			System.out.print("메뉴 선택 : ");
			int menu = sc.nextInt();
			
			if (menu ==1) {
				// 재생				
				for (int i=0; i<list.size(); i++) {
					System.out.println((i+1)+". "+list.get(i).getTitle());
				}
				System.out.print("노래 선택 : ");
				int sing = sc.nextInt();
				idx = sing;
				// 노래 재생중 노래가 겹치는일을 방지
				if (mp3.isPlaying()) {
					mp3.stop();
				}
				
				mp3.play(list.get(sing).getPath());
				System.out.println(list.get(sing).getTitle()+"~~~재생중");
				System.out.println("가수 : "+list.get(sing).getArtist());
				System.out.println("길이 : "+list.get(sing).getLength());
				
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
				mp3.stop();
			}
			else if (menu ==3) {
				
				idx++;
				if (idx>list.size()) {
					idx = 0;
				}
				
				if (mp3.isPlaying()) {
					mp3.stop();
				}
				ex01_Music music = list.get(idx);
				mp3.play(music.getPath());
					
				System.out.println(music.getTitle()+"~~~재생중");
				System.out.println("가수 : "+music.getArtist());
				System.out.println("길이 : "+music.getLength());
				
			}
			else if (menu ==4) {
				// 이전곡
				
				idx--;
				if (idx<0) {
					idx = list.size()-1;
				
				if (mp3.isPlaying()) {
					mp3.stop();
				}
				
				ex01_Music music = list.get(idx);
				mp3.play(music.getPath());
						
				System.out.println(music.getTitle()+"~~~재생중");
				System.out.println("가수 : "+music.getArtist());
				System.out.println("길이 : "+music.getLength());
				
				}
				
			}
			else if (menu ==5) {
				
				Random ran = new Random();
				idx = ran.nextInt(0,list.size());
				
				
				if (mp3.isPlaying()) {
					mp3.stop();
				}
				
				ex01_Music music = list.get(idx);
				mp3.play(music.getPath());
						
				System.out.println(music.getTitle()+"~~~재생중");
				System.out.println("가수 : "+music.getArtist());
				System.out.println("길이 : "+music.getLength());
			}
			else if (menu == 6) {
				System.out.println("종료합니다.");
				mp3.stop();
				break;
			}
			else {
				System.out.println("메뉴를 다시 선택해 주세요.");
			}
		}
		
		
	}

}
