package com.demo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.demo.domain.ProductVO;

//	데이터를 JSON으로 리턴 받는 예제. (클라이언트로 객체를 JSON 데이터 형식으로 보내는 예제)
//	객체를 JSON 데이터 형식으로 변환하는 기능의 라이브러리를 프로젝트에서 참조한다.

@Controller
public class SampleController5 {
	
//	로그 작업목적.
	private static final Logger logger = LoggerFactory.getLogger(SampleController5.class);
	
//	에러 : No converter found for return value of type: class com.demo.domain.ProductVO
//	원인 : JSON라이브러리를 추가하지 않음. pom.xml에 작업.
	@GetMapping("doJSON")
	public @ResponseBody ProductVO doJSON() {
	
		ProductVO vo = new ProductVO("상품1", 30000);
		return vo;
		
	}

	
}
