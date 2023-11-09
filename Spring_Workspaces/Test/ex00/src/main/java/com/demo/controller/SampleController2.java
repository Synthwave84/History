package com.demo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
//	현재 클래스가 매핑주소로 사용할 클래스 이면, @Controller Annotation을 해야한다.

//	매핑주소에 쿼리스트링을 메소드에서 파라미터로 참조.
@Controller
public class SampleController2 {
	
	private static final Logger logger = LoggerFactory.getLogger(SampleController2.class);
	
//	매핑 주소 설정 작업
//	http://localhost:9091/doD?id=docomsa&age=100 정상작동
//	http://localhost:9091/doD 500 에러
//	String id 참조타입은 null로 처리가 된다. 그러나 기본 데이터타입 (primitive type)
//	은 반드시 값이 제공되어야 한다.
	
//	쿼리 스트링에 의한 값을 파라미터로 전달하고, 그 값을 jsp에서 사용할 경우.
	
	@GetMapping("doD")
	public String doD(@ModelAttribute("id") String id,@ModelAttribute("age") int age) {
		logger.info("아이디:" + id);
		logger.info("나이:" + age);
		
//		jsp 명 > result.jsp
		return"result";
	}
//	http://localhost:9091/doE?id=docomsa&age=100 정상작동
//	http://localhost:9091/doE
//	매핑 , 모델어트리뷰트를 쓰면 메소드단위 에러가 난다.
//	int age -> Integer age로 변경시, age Parameter 값을 제공하지 않으면, null로 처리되며
//	에러는 발생하지 않는다.
	@GetMapping("doE")
	public String doE(String id, Integer age) {
		logger.info("아이디:" + id);
		logger.info("나이:" + age);
		return "doE";
	}
	
}
