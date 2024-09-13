package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Command {
	// 메소드 구현 내용은 자식클래스가 전부 담당
	// 메소드 {} body 영역이 필요없네? >> 추상 메소드를 가지고 있어야한다.
	// >> abstract 키워드 생략 가능한 interface로 부모 클래스를 만들기
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException;
	
	
	
	
}
