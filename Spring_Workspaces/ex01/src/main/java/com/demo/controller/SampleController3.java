package com.demo.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.demo.domain.SampleDTO;

@RequestMapping("/sample3/*")
@Controller
public class SampleController3 {
	
	
	private static final Logger logger = LoggerFactory.getLogger(SampleController3.class);
//	dto 객체를 JSON 데이터포멧으로 변환하여, 클라이언트에게 응답.
//	JSON 라이브러리 필요(jackson-databind 필요)
//	https://mvnrepository.com/ 사이트 참조후 pom.xml 파일 작업
	@GetMapping("/doA")
	public @ResponseBody SampleDTO doA() {
		SampleDTO dto = new SampleDTO();
		dto.setAge(100);
		dto.setName("홍길동");
		
		return dto;
	}
	
//	ReponseEntity 클래스 사용법
//	Http 상태코드와 응답 헤더 및, 응답본문(데이터)를 생성하며, 클라이언트에게 전달할 때 사용.
//	AJAX 기능과 함께 사용
	@GetMapping("/doB")
	public ResponseEntity<SampleDTO> doB() {
		ResponseEntity<SampleDTO> entity = null;
		
//		1) 응답 데이터 dto ->JSON
		SampleDTO dto = new SampleDTO();
		dto.setAge(100);
		dto.setName("홍길동");
		
//		2) 헤더: JSON데이터(응답데이터)에 대한 설명,
		HttpHeaders header = new HttpHeaders();
		header.add("Content-Type", "application/json;charset=UTF-8");
		
//		3) 상태 코드
		entity = new ResponseEntity<SampleDTO>(dto, header, HttpStatus.OK);
		
//		응답 데이터
//		1) jsp로 실행된 응답데이터라면, 클라이언트에게 보내는 상태코드는 웹서버에서 자동으로 처리된다.
//		Content-Type, 인코딩 정보
//		2) entity객체의 응답데이터 dto->json으로 변환
		
//		
		return entity;
	}
	
//	파일 업로드기능
//	- 업로드 기능을 제공해 주는 라이브러리
	
	
	
//	1) 파일 업로드 폼
	@GetMapping("/upload")
	public void upload() {
		logger.info("called upload...");
	}
	
//	2) 업로드 파일 처리. 여러개 파일이 업로드를 구현하고자 할 때
//	servlet-context.xml의 multipartResolver bean등록.
//	URL 매핑 주소는 프로젝트내에서 유일해야하나, 방식이 다르면 중복 사용이 가능하다.
	@PostMapping("/upload")
	public void upload(ArrayList<MultipartFile> files) {
	files.forEach(file -> {
		logger.info("--------------------------------");
		logger.info("파일 이름 :"+ file.getOriginalFilename());
		logger.info("파일 크기 :" + file.getSize());
		logger.info("--------------------------------");
	});
	
//	하단의 for문으로도 작성 가능
	/*
	logger.info("--------------------------------");
	for(int i=0; i<files.size(); i++) {
		logger.info("파일이름 :" + files.get(i).getOriginalFilename());
		logger.info("파일크기 :" + files.get(i).getSize());
	}
	logger.info("--------------------------------");
	*/
	
//	실제 파일 업로드 작업.
	
	
	}
}
