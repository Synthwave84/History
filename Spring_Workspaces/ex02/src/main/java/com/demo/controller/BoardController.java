package com.demo.controller;



import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.domain.BoardVO;
import com.demo.service.BoardService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

//	게시판의 기능에 사용할 URL매핑주소를 구성요소로 하는 컨트롤러 기능의 클래스.
//	BoardController에서는 BoardServiceImpl의 메소드를 호출한다.

//	servlet-context.xml 파일내에
//	<context:component-scan base-package="com.demo.controller" /> 생성
//	pom.XML 파일에서 <groupid>log4j</groupid>라인의 <scope>runtime</scope> 주석처리
//	log객체 지원을 해준다.
@Log4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/board/*")
public class BoardController {
	private final BoardService boardService;
	
	/* <<롬복이 대신 처리
	public BoardController(BoardService boardService) {
		this.boardService = boardService;
	}
	*/
	
//	매핑주소 = /board/register
//	글쓰기 폼
	@GetMapping("/register")
	public void register() {
		log.info("called register...");
	}
	
//	매핑 주소 /board/register
//	저장버튼 클릭 후 글쓰기 저장
//	괄호 주소는 달라도 괜찮다. 
	@PostMapping("/register")
	public String register(BoardVO board) {
//		board.toString()이 호출된다.
		log.info("게시판 입력 데이터 :" + board);
//		DB저장 작업
		/*
		1)BoardMapper 인터페이스와 BoardMapper.xml작업이 먼저.
		2)BoardService인터페이스와 BoardServiceImpl 작업.
		
		*/
//		JSP파일의 유무로 리턴 정해짐
		boardService.register(board);
//		주소는 절대경로
		return "redirect:/board/list";
	}
	
//	목록 /board/list
//	필수적으로 파라미터값은 모델 을 사용해야한다.
//	Model model = JSP파일에 데이터(대부분의 경우 DB)를 출력 하고자 할 때.
	@GetMapping("/list") 
	public void list(Model model) {
//		서비스 메소드 호출
		List<BoardVO> list =boardService.getList();
		model.addAttribute("list" , list);
	}
//	매핑주소
//	상세내용
//	게시물 읽기 :리스트에서 제목을 클릭했을 떄, 게시물 번호가 데이터를 출력
	@GetMapping({"/get", "/modify"}) 
	public void get(@RequestParam("bno") Long bno, Model model) {
//		목록에서 선택한 게시물 번호
		
		log.info("게시물번호" + bno);
		BoardVO board= boardService.get(bno);
		model.addAttribute("board", board);
	}
//	수정하기
	@PostMapping("/modify") 
	public String modify(BoardVO board) {
		log.info("수정 데이터" + board);
//		DB저장
		boardService.modify(board);
		
		return "redirect:/board/list";
	}
	
}
