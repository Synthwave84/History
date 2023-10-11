package com.demo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SampleController {
	
	private static final Logger logger = LoggerFactory.getLogger(SampleController.class);
//	메소드의 리턴타입이 void 일 경우 매핑 URL이 jsp파일명이 된다.
//	메소드의 리턴타입이 있을 경우 리턴타입이 jsp파일명에 해당이 된다.
//	@GetMapping("URL매핑주소")
//	/Sample/doA
	@GetMapping("/Sample/doA")
	public void doA() {
		
	}
//	/Sample/doB
	@GetMapping("/Sample/doB")
	public void doB( ) {
		
	}
//	/Sample/doC
	@GetMapping("/Sample/doC")
	public void doC() {
		
	}
	
}
