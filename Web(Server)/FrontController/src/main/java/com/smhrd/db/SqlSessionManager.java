package com.smhrd.db;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionManager { //DB연결, 해제
	public static SqlSessionFactory sqlSession;

	   static {
	      String resource = "com/smhrd/db/mybatis-config.xml";
	      Reader reader;
	      try {
	         reader = Resources.getResourceAsReader(resource);
	         sqlSession = new SqlSessionFactoryBuilder().build(reader);
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	   }
	   //SqlSessionFactory sqlSession = new SqlSessionManager.getSqlSession();
	   //DAO에서 호출

	   public static SqlSessionFactory getSqlSession() {
	      return sqlSession;
	   }

}
