package com.demo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

//  주소 이동시 값을 파라미터로 보낼 때 사용 : RedirectAttributes 
//	차이점. 테스트  doG와 doI요청시 브라우저의 파라미터 유무를 확인 할 것.
//	rttr.addAttribute(attributeName, attributeValue);
//	rttr.addFlashAttribute(attributeName, attributeValue);



@Controller
public class SampleController4 {
	private static final Logger logger = LoggerFactory.getLogger(SampleController4.class);
	
	
//	1) rttr.addAttribute(attributeName, attributeValue);
//	jsp파일이 필요 없다.
	@GetMapping("doG")
//	주소로 리다이렉트 되면서 값을 전달하고자 할 경우, 메소드의 파라미터로 RedirectAttribute rttr 사용.
	public String doG(RedirectAttributes rttr) {
		
//		DB작업.
//		주소로 리다이렉트 되면서 값을 전달하고자 할 경우.
//		response.sendRedircet("이동주소");
//		return "redirect:/이동매핑주소";
		
//		하단의 작업 덕분에 쿼리스트링이 딸려온다
//		http://localhost:9091/doH?msg=Hello
		rttr.addAttribute("msg", "Hello");
		return "redirect:/doH";
	}
	
//	요청 주소가 jsp파일 명. 클라이언트에서 직접 주소를 사용하진 않는다.
	@GetMapping("doH")
	public void doH(String msg) {
		logger.info("doH called..." + msg);
	}
	
//	2) rttr.addFlashAttribute(attributeName, attributeValue);
//	하단의 방식으로는 파라미터에 쿼리스트링이 딸려오지 않는다.
	@GetMapping("doI")
	public String doI(RedirectAttributes rttr) {
		
//		rttr.addAttribute(attributeValue);
//		doJ매핑주소의 jsp에서 참조.
		rttr.addFlashAttribute("msg","success");
		
		return "redirect:/doJ";
	}
//	doJ를 직접 요청하면, msg 값이 참조가 되지 않는다.]
	@GetMapping("doJ")
	public void doJ() {
//		doJ.jsp 파일에서 msg 파라미터의 값을 참조.
		
	}
}
