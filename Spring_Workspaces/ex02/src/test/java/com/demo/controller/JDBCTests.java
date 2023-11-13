package com.demo.controller;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

// 오라클 데이타베이스 드라이버(ojdbc8.jar)를 이용한 연결테스트.

public class JDBCTests {

	private static final Logger logger = LoggerFactory.getLogger(JDBCTests.class);
	
	static {
		// jdbc작업에 사용하는 메서드를이 예외처리 특징을 가지고 있다.
		try {
			Class.forName("oracle.jdbc.OracleDriver"); // 메모리상에 DriverManager객체생성 
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	//오라클서버에  연결테스트 메서드
	@Test // JUnit 를 이용한 테스트 메서드로 설정.
	public void testConnection() {
		long start = System.currentTimeMillis();
		//연결작업.  10000번을 테스트 할려고 했으나, 오라클데이타베이스 설정부분으로 인하여, 테스트 못함.
		// https://blog.naver.com/PostView.nhn?blogId=deersoul6662&logNo=221812017367 참고
		for(int i=0; i<1; i++) {
			// conn객체를 자동으로 close() 처리를 해준다.
			// AutoCloseable 상속받는 클래스만 사용가능.
			try(Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "ora_user", "1234")) {
				
			}catch(Exception ex) {
				fail(ex.getMessage());
			}
		}
		long end = System.currentTimeMillis();
		
		logger.info("연결속도: " + (start-end));
	}
	
	
	
	
	@Test
	public void test() {
		fail("Not yet implemented");
	}

}
