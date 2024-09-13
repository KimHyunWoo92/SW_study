package mp3player;

public class ex01_Music {
	
	
	private String artist;
	private String title;
	private String length;
	private String path;
	
	public ex01_Music(String artist,String title,String length,String path) {
		this.artist = artist;
		this.title = title;
		this.length = length;
		this.path = path;
	}
	
	public String getArtist() {
		return artist;
	}
	public void setArtist(String artist) {
		this.artist = artist;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLength() {
		return length;
	}
	public void setLength(String length) {
		this.length = length;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	
	
}
