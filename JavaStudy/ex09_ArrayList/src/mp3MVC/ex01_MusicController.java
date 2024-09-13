package mp3MVC;

import java.util.ArrayList;
import java.util.Random;

import javazoom.jl.player.MP3Player;

public class ex01_MusicController {
	
	// Controller 부분 : 모든 기능들을 가지고 있는 도구
	
	
	// 1. 필드(데이터)
	// 사용자마다 mp3player가 달라지지 않기 떄문에 그냥 바로 생성!!
	// MusicController를 벗어나서 사용하지 않을거기 떄문에 private 키워드 생성!
	
	private MP3Player mp3 = new MP3Player();
	private int idx =0;
	private ArrayList<ex01_Music> list = new ArrayList<ex01_Music>();
	
	
	// 2. 메소드
	// 1) 생성자 메소드
	public ex01_MusicController() {
		String path = "C:\\Users\\SMHRD\\Desktop\\JavaStudy\\ex09_ArrayList\\mp3player\\";
		list.add(new ex01_Music("ZICO","SPOT!","02:47",path+"SPOT!.mp3"));
		list.add(new ex01_Music("에스파","Supernova","02:59",path+"Supernova.mp3"));
		list.add(new ex01_Music("QWER","고민중독","02:55",path+"고민중독.mp3"));
		list.add(new ex01_Music("아이브","해야","03:09",path+"해야(HEYA).mp3"));
	}
	
	// 2) 재생하는 메소드
	public ex01_Music play() {
		ex01_Music music = list.get(idx);
		if (mp3.isPlaying()) {
			mp3.stop();
		}
		mp3.play(music.getPath());
		return music;
	}
	
	// 3)정지하는 메소드
	public boolean stop() {
		boolean result = false;
		if (mp3.isPlaying()) {
			mp3.stop();
			result = true;
		}
		return result;
	}
	
	// 4)다음곡을 재생하는 메소드
	public ex01_Music nextplay() {
		idx++;
		if (idx>list.size()) {
			idx = 0;
		}
		
		if (mp3.isPlaying()) {
			mp3.stop();
		}
		ex01_Music music = list.get(idx);
		mp3.play(music.getPath());
		return music;
	}
	
	// 5) 이전곡을 재생하는 메소드
	public ex01_Music preplay() {
		idx--;
		if (idx<0) {
			idx = list.size()-1;
		}
		if (mp3.isPlaying()) {
			mp3.stop();
		}
		ex01_Music music = list.get(idx);
		mp3.play(music.getPath());
		return music;
		
		}	
	
	// 6) 랜덤 실행
	public ex01_Music ranplay() {
		Random ran = new Random();
		idx = ran.nextInt(0,list.size());
		
		
		if (mp3.isPlaying()) {
			mp3.stop();
		}
		
		ex01_Music music = list.get(idx);
		mp3.play(music.getPath());
		return music;
	}
	
	
	
	
	
	
	
	
	
	
	
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

