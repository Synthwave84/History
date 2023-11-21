package com.demo.controller;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

// Oracle DataBase Driver(ojdbc8.jar)을 이용한 연결테스트

public class JDBCTests {

	private static final Logger logger = LoggerFactory.getLogger(JDBCTests.class);
	
	static {
		// jdbc 작업에 사용하는 메소드는 예외처리 특징을 가지고 있다.
		try {
			Class.forName("oracle.jdbc.OracleDriver"); // 메모리상에 DriverManager 객체 생성
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 오라클서버에 연결테스트 메소드
	@Test // JUnit 을 이용한 테스트 메소드로 설정
	public void testConnection() {
		long start = System.currentTimeMillis();

		// 연결작업 // 10000 번을 테스트 하려 했으나, 오라클 데이터베이스 설정부분으로 인하여, 테스트 하지 못했다.
		// error : ora-12519
		for(int i=0; i<10; i++) {
			// conn 객체를 자동으로 close() 처리를 해준다. // AutoCloseable을 상속받는 클래스만 사용 가능
			try(Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "ora_user", "0000")) {
				
			} catch(Exception e) {
				fail(e.getMessage());				
			}
		}
		
		long end = System.currentTimeMillis();
		
		logger.info("연결속도 : " + (end-start));
	}
	
//	@Test
//	public void test() {
//		fail("Not yet implemented");
//	}

}
