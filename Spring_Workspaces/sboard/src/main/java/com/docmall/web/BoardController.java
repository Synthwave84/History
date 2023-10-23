package com.docmall.web;

import java.util.List;



import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.docmall.domain.Criteria;
import com.docmall.domain.PageDTO;
import com.docmall.domain.SboardVO;
import com.docmall.service.BoardService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

//	1) Controller 작업
@Controller
//	2) 리퀘스트 매핑 작업.
@RequestMapping("/sboard/*")
//	3) lombok 컨스트럭터 작업
@RequiredArgsConstructor
//	4) 로거 작업
@Log4j
public class BoardController {
	private final BoardService boardService;
	
//	1) 글쓰기 작업
	@GetMapping("/register")
	public void register() {
		log.info("레지스터 콜");
	}
	
//	2) 글 등록 작업
	@PostMapping("/register")
	public String register(SboardVO board) {
		log.info("레지스터 등록 데이터 : " + board);
		boardService.register(board);
		;
		return "redirect:/sboard/list";
	};
	
//	3) 글 목록 확인 작업
//		- 데이터 확인을 목적으로 하는 Model 인터페이스 호출.
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		log.info("List : " + cri);

//		페이징 기능을 이용하기 위한 list 작업. 
		List<SboardVO> list = boardService.getListWithPage(cri);
		model.addAttribute("list", list);
		
//		페이지 정보를 확인하기 위한 DTO를 생성자로 호출 및 페이지 정보를 받아올 model 작업.		
		int total = boardService.getTotalCount(cri);
		log.info("데이터 총 량" + total);
		PageDTO pageDTO = new PageDTO(cri, total);
		model.addAttribute("pageInfo", pageDTO);
		
	}
	
//	4) 글 읽기 작업
	@GetMapping({"/get","/modify"})
	public void get (@RequestParam("idx") Long idx, 
			@ModelAttribute("cri") Criteria cri, Model model) {
		SboardVO board = boardService.get(idx);
		model.addAttribute("board",board);
	};
	
//	5) 수정 작업
	@PostMapping("/modify") 
	public String modify(SboardVO board, Criteria cri, RedirectAttributes rttr) {
		log.info(board);
		boardService.modify(board);
		return "redirect:/sboard/list"+cri.getListLink();
	}
	
//	6) 삭제 작업
	@GetMapping("/delete")
	public String delete(@RequestAttribute("idx") Long idx, Criteria cri, RedirectAttributes rttr) {
		boardService.delete(idx);
		return "redirect:/sboard/list"+ cri.getListLink();
	}
	
	
}
