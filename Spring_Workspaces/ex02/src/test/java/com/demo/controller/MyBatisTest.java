package com.demo.controller;

import static org.junit.Assert.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

// Mybatis 라이브러리 관련 테스트 예제

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml/"})
public class MyBatisTest {
	
	@Autowired // DI(Dependency Injection) 의존성 주입
	private SqlSessionFactory sqlFactory;
	
	@Test // sqlFactory 객체가 주입에 성공되었는지 검사
	public void testFactory() {
		System.out.println(sqlFactory);
	}
	
	@Test
	public void testSession() {
		try(SqlSession session = sqlFactory.openSession()) {
			System.out.println(session);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
