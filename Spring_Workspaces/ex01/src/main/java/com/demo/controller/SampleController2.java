package com.demo.controller;

import java.util.ArrayList;
import java.util.Arrays;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.domain.BoardVO;
import com.demo.domain.MemberVO;
import com.demo.domain.SampleDTO;
import com.demo.domain.SampleDTOList;

//	URL 매핑 주소를 가지고 있는 클래스에 적용 
@RequestMapping("/sample2/*")
@Controller
public class SampleController2 {

	private static final Logger logger = LoggerFactory.getLogger(SampleController2.class);
// 	공통경로작업 
//	sample2/ 로 시작되는 모든 주소에 대하여 클래스가 요청을 담당.

	

@GetMapping("/basic")
//	sample2/basic
	public String basic() {
	logger.info("called basic...");
//		리턴값이 jsp 파일명이 된다.
		return "/sample2/basicPro";
	}
	
@RequestMapping(value = "basicPro", method = {RequestMethod.GET,RequestMethod.POST})
//	sample2/basicPro
	public String basicPro(SampleDTO dto) {
//	dto.toString() 이 호출된다.{
	logger.info("called basicPro..." + dto);
//		리턴값이 jsp 파일명이 된다.
		return "/sample2/basicPro";
	}

	@GetMapping("/write")
	public String write() {
		logger.info("called write....");
		return "/sample2/write";
	}
	
	@PostMapping("write")
	public String writePOST(BoardVO vo) {
		logger.info("called writePOST" +vo);
		return "/sample2/write";
	}
	
	@GetMapping("/join")
	public void join() {
		logger.info("called join...");
	}
	
	@PostMapping("/join")
	public void join(MemberVO vo) {
		logger.info("result" + vo );
	}
	
//	1) 배열
//  localhost:9091/sample2/array?idx=10&idx=20&idx=30
	@GetMapping("/array")
	public void array(@RequestParam ("idx") String[] idx) {
		logger.info("idx :" + Arrays.toString(idx));
	}
	
//	2)컬렉션
//	@RequestParam 어노테이션 사용.
//	클라이언트에서 동일한 파라미터명으로 데이터가 전송 될 때 
//	htttp://localhost:9091/sample2/list?idx=10&idx=20&idx=30
	@GetMapping("/list")
//	<> 제네릭 문법 중 타입 파라미터문법. 
//	ArrayList<String> 외에 Integer (참조값) 으로도 받을 수 있다.
	public void list(@RequestParam ("idx") ArrayList<String> a) {
		logger.info("idx :" + a);
	}


	
//  localhost:9091/sample2/list2?userid=docomsa&age=100
	@GetMapping("/list2") 
	public void list2(String userid, int age) {
		logger.info("userid :" + userid);
		logger.info("age :" + age);
	}
	
//	클라이언트에서 전송에 사용하는 파라미터명과 스프링의 메서드 매개변수가 다를 경우.
//  localhost:9091/sample2/list3?id=docomsa&old=100	
	@GetMapping("/list3") 
	public void list3(@RequestParam("id") String userid,@RequestParam("old") int age) {
		logger.info("userid :" + userid);
		logger.info("age :" + age);
	}
	
//	클라이언트 전송에 사용하는 파라미터명과 스프링 매개변수가 동일 시, 괄호 내용을 생략해도 된다.
//  localhost:9091/sample2/list4?userid=docomsa&age=100
	@GetMapping("/list4") 
	public void list4(@RequestParam String userid,@RequestParam int age) {
		logger.info("userid :" + userid);
		logger.info("age :" + age);
	}
	
//  localhost:9091/sample2/list5?userid=docomsa&age=100 <-성공
//  localhost:9091/sample2/list5 <- 실패 Required String parameter 'userid' is not present
//  localhost:9091/sample2/list5?userid=docomsa& <- 성공
	@GetMapping("/list5") 
	public void list5
	(@RequestParam(required = true) String userid,
	 @RequestParam(required = false) Integer age) {
		logger.info("userid :" + userid);
		logger.info("age :" + age);
	}
//  localhost:9091/sample2/list6?userid=docomsa&age=100 <-성공
//  localhost:9091/sample2/list6 <- 성공 defaultValue.
//  localhost:9091/sample2/list6?userid=docomsa& <- 성공
	
	@GetMapping("/list6") 
	public void list6
	(@RequestParam(required = true,defaultValue = "guest") String userid,
	 @RequestParam(required = false, defaultValue = "-1") Integer age) {
		logger.info("userid :" + userid);
		logger.info("age :" + age);
	}
	
//	SampleDTOList 클래스 사용 예.
	
//	1) Form
	@GetMapping("/beanForm")
	public void beanForm() {
		logger.info("called beanForm...");
	}
	
//	2) Form에서 넘어온 데이터 처리.
	@RequestMapping("/beanPro") 
		public void beanPro(SampleDTOList lst) {
		
		logger.info("list 컬렉션 데이터 : " + lst);
	}
	
	
	
}
