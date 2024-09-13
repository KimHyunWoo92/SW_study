package mp3player;

import javazoom.jl.player.MP3Player;

public class ex01_사용법 {

	public static void main(String[] args) {
		/*
		 jar
		 -> 일종의 java project를 압축해놓은 확장자
		 -> 다른사람이 개발해놓은 class 파일들이 모여있는 형태
		 -> 일종의 라이브러리
		 
		 jar파일 추가하는 방법
		 프로젝트 선택 -> 마우스 우클릭 -> build path -> configure build path
		 -> libraries 탭으로 이동 -> class path 선택 -> 우측에 add jars 클릭
		 -> 원하는 jar파일 추가 -> apply and close
		 
		 1. 노래 재생하기
		 (1) Mp3player 객체 생성
		 
		 */
		
		MP3Player mp3 = new MP3Player();
		String path = "C:\\Users\\SMHRD\\Desktop\\JavaStudy\\ex09_ArrayList\\mp3player\\";
		
		// 1.재생하기
		mp3.play(path+"Bubble Gum.mp3");
		
		// 2.정지하기
		mp3.stop();
		
		// 3.노래가 현재 재생중인지 확인
		System.out.println(mp3.isPlaying());
		
		
		
	}

}
