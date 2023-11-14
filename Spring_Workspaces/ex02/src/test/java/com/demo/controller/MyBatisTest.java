package com.demo.controller;

<<<<<<< HEAD
import static org.junit.Assert.*;

=======
>>>>>>> 967ebdd261254dcf2b4a04c05b4622a31c2ee409
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

<<<<<<< HEAD
// Mybatis 라이브러리 관련 테스트 예제.

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class MyBatisTest {
	// DI(Dependency Injection) : 의존성주입.
	@Autowired
	private SqlSessionFactory sqlFactory;
	
	@Test // sqlFactory 객체가 주입에 성공되었는 지 검사
	public void testFactory() {
		System.out.println(sqlFactory);
	}
	
	@Test
	public void testSession() {
		try(SqlSession session = sqlFactory.openSession()) {
			System.out.println(session);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}

=======
// MyBatis 라이브러리 관련 테스트 예쩨

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
public class MyBatisTest {
   // DI(Dependency Injection): 의존성 주입
   @Autowired
   private SqlSessionFactory sqlFactory;

   @Test // sqlFactory 객체가 주입에 성공되었는지를 검사
   public void testFactory() {
      System.out.println(sqlFactory);
   }

   @Test
   public void testSession() {
      try (SqlSession session = sqlFactory.openSession()) {
         System.out.println(session);
      } catch (Exception ex) {
         ex.printStackTrace();
      }
   }
>>>>>>> 967ebdd261254dcf2b4a04c05b4622a31c2ee409
}
