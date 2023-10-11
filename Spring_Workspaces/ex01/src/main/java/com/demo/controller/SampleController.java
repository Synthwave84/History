package com.demo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

//	공통주소 만드는 예제.

//	매핑URL이 특정 동일경로에 존재 할 시, 하단의 매핑주소에 공통경로로써 사용된다.
//	여러개의 요청방식을 이용하여, 하나의 메소드를 공유
@RequestMapping("/sample/*")
@Controller
public class SampleController {
	
	private static final Logger logger = LoggerFactory.getLogger(SampleController.class);
//	메소드의 리턴타입이 void 일 경우 매핑 URL이 jsp파일명이 된다.
//	메소드의 리턴타입이 있을 경우 리턴타입이 jsp파일명에 해당이 된다.
//	@GetMapping("URL매핑주소")
//	/sample/doA
	@GetMapping("doA")
	public void doA() {
		logger.info("called doA...");
		
	}
//	/sample/doB
	@GetMapping("doB")
	public void doB( ) {
		logger.info("called doB...");
	}
//	/sample/doC
	@GetMapping("doC")
	public void doC() {
		logger.info("called doC...");
	}
	
//	@GetMapping 과 동일하다.
	@RequestMapping(value = "doD", method = RequestMethod.GET)
	public void doD() {
		logger.info("called doD....");			
	}
	
//	배열로 작성 시 한번에 많은 매핑주소를 할당할 수 있다.
//	/sample/doE or /sample/doF 주소
	@RequestMapping(value = {"doE","doF"}, method = RequestMethod.GET)
	public void basic() {
		logger.info("basic called...");
	}
	
//	클라이언트 요청 Get, Post 방식을 테스트 한다.
//	/sample/basic
	@GetMapping("basic")
	public void basicForm() {
		logger.info("basicForm called...");
	}
	
	
//	배열방식을 이용하여 Post, get 메소드를 둘다 이용할 수 있다.
//	클라이언트 요청 방식이 각각 get. post 방식 둘다 허용
	@RequestMapping(value = "basicPro", method = {RequestMethod.GET, RequestMethod.POST})
	public void doGetPost() {
		logger.info("called doGetPost");
	}
	
	
	
}
