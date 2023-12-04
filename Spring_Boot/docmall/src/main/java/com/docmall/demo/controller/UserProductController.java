package com.docmall.demo.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.docmall.demo.domain.ProductVO;
import com.docmall.demo.dto.Criteria;
import com.docmall.demo.dto.PageDTO;
import com.docmall.demo.service.UserProductService;
import com.docmall.demo.util.FileUtils;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Slf4j
@RequestMapping("/user/product/*")
@Controller
public class UserProductController {

	private final UserProductService userProductService;
	
	// 메인및썸네일 이미지업로드 폴더경로 주입작업
	@Value("${file.dir}")
	private String uploadPath;
	
	// 매핑주소1: /user/product/pro_list?cg_code=2차카테고리코드
	/*
	@GetMapping("/pro_list")
	public void pro_list(Criteria cri , @RequestParam("cg_code") Integer cg_code) throws Exception {
		
		
		
	}
	*/
	// 매핑주소2: /user/product/pro_list
	@GetMapping("/pro_list")
	public String pro_list(Criteria cri ,@ModelAttribute("cg_code") Integer cg_code, @ModelAttribute("cg_name") String cg_name, Model model) throws Exception {
		
		cri.setAmount(8);
		
		
		List<ProductVO> pro_list = userProductService.pro_list(cg_code, cri);
		
		// 날짜폴더의 역슬래시를 슬래시로 바꾸는 작업.  이유? 역슬래시로 되어있는 정보가 스프링으로 보내는 요청데이타에 사용되면 에러발생.
		// 스프링에서 처리 안하면, 자바스크립에서 처리 할수도 있다.
		pro_list.forEach(vo -> {
			vo.setPro_up_folder(vo.getPro_up_folder().replace("\\", "/"));
		});
		model.addAttribute("pro_list", pro_list);
		
		int totalCount = userProductService.getTotalCount(cg_code);
		model.addAttribute("pageMaker", new PageDTO(cri, totalCount));
		
		return "/user/product/pro_list";
		
	}
	
	//상품리스트에서 보여줄 이미지.  <img src="매핑주소">
	@ResponseBody
	@GetMapping("/imageDisplay") // /user/product/imageDisplay?dateFolderName=값1&fileName=값2
	public ResponseEntity<byte[]> imageDisplay(String dateFolderName, String fileName) throws Exception {
		
		return FileUtils.getFile(uploadPath + dateFolderName, fileName);
	}
	
	//상품상세. 하단 상품후기포함.
	@GetMapping("/pro_detail")
	public void pro_detail(Criteria cri, Integer cg_code, @ModelAttribute("cg_name") String cg_name, Integer pro_num, Model model) throws Exception {
		
		log.info("페이징정보: " + cri);
		log.info("상품코드: " + pro_num);
		
		ProductVO productVO = userProductService.pro_detail(pro_num);
		//클라이언트에서 이미지 출력작업.   \ 역슬래시가 서버로 보낼때 문제가 되어서, / 슬래시 사용하고자 
		productVO.setPro_up_folder(productVO.getPro_up_folder().replace("\\", "/"));
		
		model.addAttribute("productVO", productVO);
		

	}
	
}
