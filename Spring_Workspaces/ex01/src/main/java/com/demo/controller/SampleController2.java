package com.demo.controller;

import java.util.ArrayList;

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
	
//	클라이언트에서 동일한 파라미터명으로 데이터가 전송 될 때 
//	htttp://localhost:9091/sample2/list?idx=10&idx=20&idx=30
	@GetMapping("/list")
//	<> 제네릭 문법 중 타입 파라미터문법. 
	public void list(@RequestParam ("idx") ArrayList<String> a) {
		logger.info("idx :" + a);
	}

}
