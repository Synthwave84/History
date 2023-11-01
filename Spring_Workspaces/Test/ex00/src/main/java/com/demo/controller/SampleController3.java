package com.demo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.demo.domain.ProductVO;

//	ProductVO 클래스 사용 : db 테이블의 데이터를 가져와서 사용하게된다.

@Controller
public class SampleController3 {
	private static final Logger logger = LoggerFactory.getLogger(SampleController3.class);
	
	@GetMapping ("doF")
	public String doF(Model model) {
//		productVo객체의 정보를 jsp에서 참조하려면, 파라미터로 Model 사용해야 한다.
//		db의 테이블 데이터를 가져온다.
		ProductVO productVO =new ProductVO("난방제품", 500000);
		
//		model.addAttribute("jsp에서 사용할 이름", productVO);s
//		product이름이 jsp에서 사용된다.
		model.addAttribute("product", productVO);
		
		
		return "productInfo";
	}

	
	
}
