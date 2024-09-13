package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class DAO {
	
	//세션을 생성해줄 수 있는 Factory 생성
	SqlSessionFactory sqlSession =  SqlSessionManager.getSqlSession();
	
	public int join(VO vo) {//vo -> id, pw, nick
		// Factory를 사용해서 회원가입할 하나의 세션 생성하기
		// 1. 연결 객체 빌려오기
		
		System.out.println(sqlSession);
		SqlSession session = sqlSession.openSession(true); // true -> auto commit
		//2. 연결객체 사용해서 어떤 sql 문구를 실행
		// --->sql 구문 : MemberMapper.xml파일 안에 있음
		
		int row = session.insert("join",vo);
		// 3. 연결 객체 반납
		session.close();
		
		return row;
		
		
	}
	public VO login(VO vo) {
		//1. 연결객체 빌려오기
		SqlSession session = sqlSession.openSession();
		//2. 연결객체 사용해서 sql구문 실행
		VO result = session.selectOne("login", vo);
		session.close();
		return result; 
	}
	
	
	

}
