package Question6_1;

import java.util.ArrayList;
import java.util.Scanner;

public class MusicPlayer_Main {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		ArrayList<MusicVO> music = new ArrayList<MusicVO>();
		
		while(true) {
			
			System.out.println("==== 뮤직 플레이어 ====");
			System.out.print("[1]등록 [2]목록 [3]삭제 [4]전체삭제 [5]종료 >>");
			int choice = sc.nextInt();

			// 등록
			if(choice ==1) {
				System.out.println("==== 등록 ====");
				
				System.out.print("제목 : ");
				String title = sc.next();
				System.out.print("가수 : ");
				String singer = sc.next();
				System.out.print("시간 : ");
				int playtime = sc.nextInt();
				music.add(new MusicVO(title,singer,playtime));
				
			}
			// 목록
			else if(choice ==2) {
				for (int i=0; i<music.size(); i++) {
					System.out.println((i+1)+". 제목 : "+music.get(i).getTitle()+"\t"+"가수 : "+music.get(i).getSinger()+"  "+"시간 : "+music.get(i).getPlayTime()+"초");
				}
			}
			// 삭제
			else if(choice ==3) {
				System.out.println("==== 노래 목록 ====");
				for (int i=0; i<music.size(); i++) {
					System.out.println((i+1)+". 제목 : "+music.get(i).getTitle()+"\t"+"가수 : "+music.get(i).getSinger()+"  "+"시간 : "+music.get(i).getPlayTime()+"초");
				}
				System.out.println("==== 노래 삭제 ====");
				System.out.print("삭제하고 싶은 번호 :");
				int cancel = sc.nextInt();
				System.out.println(music.get(cancel-1).getTitle());
				music.remove(cancel-1);
			}
			// 전체삭제
			else if(choice ==4) {
				System.out.println("==== 전체노래 삭제 ====");
				System.out.println("전체 노래가 삭제되었습니다.");
				music.clear();
			}
			// 종료
			else if(choice ==5) {
				System.out.println("종료합니다.");
				break;
			}else {
				System.out.println("정확한 숫자를 입력해주세요");
			}
			
			
		}
	}

}
