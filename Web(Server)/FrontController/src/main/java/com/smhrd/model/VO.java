package com.smhrd.model;

public class VO {
	private String id;
	private String pw;
	private String nick;
	
	
	
	// 기본생성자
	public VO() {
	}
	
	// 회원가입을 위한 생성자 메소드
	public VO(String id, String pw, String nick) {
		super();
		this.id = id;
		this.pw = pw;
		this.nick = nick;
	}

	public String getId() {
		return id;
	}
	public String getPw() {
		return pw;
	}
	public String getNick() {
		return nick;
	}

}
