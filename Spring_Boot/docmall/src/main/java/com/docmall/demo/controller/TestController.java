package com.docmall.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.docmall.demo.service.TestService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@RequiredArgsConstructor
@Controller
//@Log4j
@Slf4j
public class TestController {

	private final TestService testService;
	
	@GetMapping("time")
	public @ResponseBody String getTime() throws Exception {
		
		log.info("called time...");
		
		return testService.getTime();
	}
}
