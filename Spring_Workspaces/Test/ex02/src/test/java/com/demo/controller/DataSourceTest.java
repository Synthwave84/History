
package com.demo.controller;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

// root-context.xml 파일의 DataSourece 를 테스트하는 예제

// JUnit 도구를 이용하여, root-context.xml 파일의 내용을 읽어들이는 의미
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class DataSourceTest {

   private static final Logger logger = LoggerFactory.getLogger(DataSourceTest.class);
   
   
// 의존성 주입(Dependency Injection = DI) Annotation 
   @Autowired
   private DataSource ds;
// 리턴이 없다. 전체가 다 보이드
   @Test
   public void testConnection() {
	   long start = System.currentTimeMillis();
//		연결작업
//		1만번 테스트를 하고자 하였느안. 오라클 데이터베이스의 설정으로 인해 테스트 부적합. 2~10회는 가능.
//		https://blog.naver.com/PostView.nhn?blogId=deersoul6662&logNo=221812017367
		for(int i=0; i<1; i++) {
//			conn객체를 자동으로 close()처리를 해준다.
//			AutoClosable를 상속받는 클래스만 사용 가능.
			
			try(Connection conn = ds.getConnection()) {
				
			}catch (Exception ex) {
				fail(ex.getMessage());
			} 
		}
   }

}