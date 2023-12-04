package com.docmall.demo.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.docmall.demo.domain.CategoryVO;
import com.docmall.demo.service.UserCategoryService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

// bean : userCategoryController 생성및등록. servlet-context.xml파일 <context:component-scan base-package="com.docmall.controller" />
@Slf4j
@RequiredArgsConstructor
@RestController // only ajax 사용.  jsp파일은 사용이 안됨. jsp파일에서 사용하기위한 데이타 작업
@RequestMapping("/category/*")
public class UserCategoryController {
	
	private final UserCategoryService userCategoryService;
	
	// 2차카테고리 정보
	@ResponseBody
	@GetMapping("/secondCategory/{cg_prtcode}")
	public ResponseEntity<List<CategoryVO>> secondCategory(@PathVariable("cg_prtcode") Integer cg_prtcode) throws Exception {
		
		
		log.info("1차카테고리 코드 : " + cg_prtcode);
		
		ResponseEntity<List<CategoryVO>> entity = null;
		
		entity = new ResponseEntity<List<CategoryVO>>(userCategoryService.getSecondCategoryList(cg_prtcode), HttpStatus.OK);
		
		// List<CategoryVO> list = adCategoryService.getSecondCategoryList(cg_parent_code)
		// list객체 -> JSON 로 변환하는 라이브러리.(jackson-databind 라이브러리:pom.xml참고)
		
		return entity;
		
	}
	
	
}
