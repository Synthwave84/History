package com.docmall.demo.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.docmall.demo.domain.CategoryVO;
import com.docmall.demo.service.AdCategoryService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/admin/category/*")
@RequiredArgsConstructor
@Slf4j
@Controller // ajax호출또는 일반호출이 함께 사용하는 경우
//@RestController (@Controller + @ResponseBody) : 모든 매핑주소가 ajax호출로 사용하는 경우
public class AdCategoryController {

	private final AdCategoryService adCategoryService;
	
	// 1차카테고리 선택에 따른 2차카테고리 정보를 클라이언트에게 제공.
	// 일반주소 /admin/category/secondCategory?cg_parent_code=1
	// RestFull 개발론 주소 /admin/category/secondCategory/1.json
	// 주소의 일부분을 값으로 사용하고자 할 경우 {} 중괄호 사용한다.
	@ResponseBody
	@GetMapping("/secondCategory/{cg_prtcode}")
	public ResponseEntity<List<CategoryVO>> secondCategory(@PathVariable("cg_prtcode") Integer cg_prtcode) throws Exception {
		
		
		log.info("1차카테고리 코드 : " + cg_prtcode);
		
		ResponseEntity<List<CategoryVO>> entity = null;
		
		entity = new ResponseEntity<List<CategoryVO>>(adCategoryService.getSecondCategoryList(cg_prtcode), HttpStatus.OK);
		
		// List<CategoryVO> list = adCategoryService.getSecondCategoryList(cg_parent_code)
		// list객체 -> JSON 로 변환하는 라이브러리.(jackson-databind 라이브러리:pom.xml참고)
		
		return entity;
		
	}
	
	
}
