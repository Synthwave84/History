package com.demo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


// 매핑주소요청 -> 메소드 호출 -> jsp 실행.

@Controller
public class SampleController {
//	컨트롤러 기능을 갖는 클래스가 동작시 로그 출력 목적.
	private static final Logger logger = 
			LoggerFactory.getLogger(SampleController.class);
	
//	매핑 주소를 get 방식으로 요청 시 사용
//	@GetMapping("매핑주소")
	@GetMapping("doA")
	public void doA() {
//		System.out은 서버내에서 작동하면 부하가 심하다.
//		System.out.println("doA called...");
		logger.info("doA called...");
		
//		servlet-context.xml파일 참조. "/WEB-INF/VIEWS/ + "doA" + ".jsp"
//		매핑 주소가 JSP 파일명이 된다. WEB-INF/views/doA.jsp 파일이 실행됨.
		
	}
	@GetMapping("testB")
	public void doB() {
		logger.info("testB called...");
	}
//	jsp파일명은 매핑 주소가 아니라, 리턴값이 된다. testC.jsp
	@GetMapping("doC")
	public String doC() {
		logger.info("doC called...");
		return "testC";
	}
	
}
