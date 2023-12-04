package com.docmall.demo.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.docmall.demo.domain.OrderDetailInfoVO;
import com.docmall.demo.domain.OrderDetailProductVO;
import com.docmall.demo.domain.OrderVO;
import com.docmall.demo.dto.Criteria;
import com.docmall.demo.dto.PageDTO;
import com.docmall.demo.service.AdOrderService;
import com.docmall.demo.util.FileUtils;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/admin/order")
@RequiredArgsConstructor
@Controller
public class AdOrderConttroller {

	private final AdOrderService adOrderService;
	
//	@Resource(name = "uploadPath") // servlet-context.xml 의 uploadPath bean이름 참조를 해야 함.
	@Value("${file.dir}")
	private String uploadPath;
	
//	상품리스트 (목록과 페이징)
	@GetMapping("/order_list")
	public void order_list(Criteria cri, 
			@ModelAttribute("start_date")String start_date,
			@ModelAttribute("end_date")String end_date, Model model) throws Exception {
		
//		this(1,10);
//		10-> 2
		cri.setAmount(4);
		
		List<OrderVO> order_list = adOrderService.order_list(cri,start_date,end_date);
		

		model.addAttribute("order_list", order_list);
		
		int totalCount = adOrderService.getTotalCount(cri,start_date,end_date);
		model.addAttribute("pageMaker", new PageDTO(cri, totalCount));
	}
	
//	상품 리스트에서 보여줄 이미지 <img src="매핑주소" -> img src ="/admin/product/imageDisplay">
//	ajax요청 시 필요함.
	@ResponseBody
//	/admin/product/imageDisplay?=dateFolderName=값1&fileName=값2
	@GetMapping("/imageDisplay")
	public ResponseEntity<byte[]> imageDisplay(String dateFolderName, String fileName) throws Exception {
		
		return FileUtils.getFile(uploadPath + dateFolderName, fileName);
	
	}
	
	@GetMapping("/order_detail_info1/{ord_code}")
	public ResponseEntity<List<OrderDetailInfoVO>> order_detail_list1(@PathVariable("ord_code") Long ord_code) throws Exception {
		
//		클래스명 = 주문상세 테이블 + 상품 테이블 조인한 결과를 담는 클래스.
		ResponseEntity<List<OrderDetailInfoVO>> entity = null;

		
		
		List<OrderDetailInfoVO> OrderDetailList = adOrderService.orderDetailInfo1(ord_code);
		
//		역슬래시 사용에 문제가 된다.
		OrderDetailList.forEach(vo -> {
			vo.setPro_up_folder(vo.getPro_up_folder().replace("\\", "/"));
		});
		
		entity = new ResponseEntity<List<OrderDetailInfoVO>>(OrderDetailList , HttpStatus.OK);
	

		
		return entity;
	}
	
	// 주문상세 방법2
	   @GetMapping("/order_detail_info2/{ord_code}") // RESTful 개발방법론의 주소
	   public String order_detail_list2(@PathVariable("ord_code") Long ord_code, Model model) throws Exception {
	      
	      List<OrderDetailProductVO> orderProductList = adOrderService.orderDetailInfo2(ord_code);
	      
	      // 날짜 폴더의 '\'를 '/'로 바꾸는 작업(이유: '\'로 되어 있는 정보가 스프링으로 보내는 요청 데이터에 사용되면 에러 발생)
	      // 브라우저에서 상품 이미지 출력 시 역슬래시 사용이 문제가 된다. 그래서 슬래시로 변환해서 클라이언트로 보냄
	      /*
	      orderProductList.forEach(vo -> {
	         vo.setPro_up_folder(vo.getPro_up_folder().replace("\\", "/"));
	      });
	      */
	      // 클래스 자체가 필드로 되어 있어 계층적으로 상위 단계를 표시해줘야 함
	      orderProductList.forEach(vo -> {
	         vo.getProductVO().setPro_up_folder(vo.getProductVO().getPro_up_folder().replace("\\", "/"));
	      });
	      
	      model.addAttribute("orderProductList", orderProductList);
	      
	      return "/admin/order/order_detail_product";
	   }
	
	
	
	@GetMapping("/order_product_delete")
	public String orderinfo_product_delete(Criteria cri, Long ord_code, Integer pro_num) throws Exception {
	
//		주문상에서 개별 삭제
		adOrderService.order_product_delete(ord_code, pro_num);
		
		return "redirect:/admin/order/order_list" + cri.getListLink();
	}
	
	
}
