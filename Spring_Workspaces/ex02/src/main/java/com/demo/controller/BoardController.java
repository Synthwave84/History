package com.demo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.demo.domain.BoardVO;
import com.demo.domain.Criteria;
import com.demo.domain.PageDTO;
import com.demo.service.BoardService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

// 게시판의 기능에 사용할 URL 매핑주소를 구성요소로 하는 컨트롤러 기능의 클래스.
// BoardController에서는 BoardServiceImpl를 호출
/*
 servlet-context.xml 파일에
 	<context:component-scan base-package="com.demo.controller" />
 위 구문이 자동으로 추가된다.
 */

// pom.xml 파일에서 <groupId>log4j</groupId> 위치에서 <scope>runtime</scope> 를 주석처리해야 @Log4j 를 사용 가능하다.
@Log4j // log객체를 지원해준다.
@Controller // servlet-context.xml 파일에
@RequestMapping("/board/*") // board가 상위 폴더로 존재해야 한다.
@RequiredArgsConstructor
public class BoardController {
	
	// 다형성을 위해 부모클래스를 이용했다.
	private final BoardService boardService;
	/*
	 @RequiredArgsConstructor 사용시 자동으로 this를 사용해 주입한다.
	 
	    private final BoardService boardService;

	    public BoardController(BoardService boardService) {
	        this.boardService = boardService;
	    }
	*/
	
	
		// 저장버튼 클릭 후 클쓰기 저장
		@GetMapping("/register") // board.toString();
		public void register() {
			log.info("called register...");
		}
		
		@PostMapping("/register")
		public String register(BoardVO board) {
			
			log.info(board);
			
			// db 저장
			boardService.register(board);
			/*
			 1) BoardMapper interface와 BoardMapper
			 2) BoardService interface와 BoardService
			 */
			return "redirect:/board/list"; // 주소는 절대경로를 모두 적어주어야 한다.
		}

		
	
		// 매핑주소  /board/list
		// 게시판 목록작업
		// Model : jsp에 데이터(DB)를 출력하고자 할 때 사용
//		@GetMapping("/list")
//		public void list(Model model) {
//			List<BoardVO> list = boardService.getList();
//			model.addAttribute("list", list); // JSP 작업 진행
//		}
		
		// 스프링이 Criteria 클래스의 기본생성자를 호출하여, 객체를 생성해준다.
		/*
		 일반 자바 문법에서는 매개변수에 값을 주어야 하지만, 스프링이 작업을 자동으로 해준다.
		 Criteria cri = new Criteria();
		 Model model = new 생성자();
		 */
		@GetMapping("/list")
		public void list(Criteria cri, Model model) {
			log.info("list : " + cri); // cri.toString()
			// Criteria(pageNum=1, amount=10, type=null, keyword=null)
			
			// 1) 페이지에 보여줄 목록데이터
			List<BoardVO> list = boardService.getListWithPaging(cri);
			model.addAttribute("list", list);
			
			// 2) 페이징기능 PageDTO 구성
			int total = boardService.getTotalCount(cri); // 테이블의 데이터 전체 갯수
			
			log.info("데이터 총갯수" + total);
			
			PageDTO pageDTO = new PageDTO(cri, total);
			model.addAttribute("pageMaker", pageDTO);
			
			log.info("페이징 정보" + pageDTO);
		}
		
		// 매핑주소 /board/get?bno=게시물번호
		// 테이블의 primary key 해당하는 값을 넘겨주어야 한다.
		// 상세 내용(게시물 읽기) : list에서 제목을 클릭했을 때 게시물번호에 데이터를 출력
		@GetMapping({"/get", "/modify"})
		public void get(@RequestParam("bno") long bno, @ModelAttribute("cri") Criteria cri, Model model) {
			// @ModelAttribute : addAttribute와 유사한 어노테이션으로 매개변수의 정보를 JSP에서 사용할 수 있게 해준다.
			
			// 목록에서 선택한 게시물번호 확인
			log.info("게시물번호 : " + bno);
			
			// 페이징과 검색정보
			log.info("페이징과 검색정보" + cri);
			
			BoardVO getBno = boardService.get(bno);
			model.addAttribute("getBno", getBno);
		}
		
		// RedirectAttributes : 페이지(주소) 이동시 파라미터 정보를 제공하는 목적으로 사용
		// 수정하기 (DB 작업후 다른 주소로 이동하려면 String type으로 설정한다.)
		@PostMapping("/modify")
		public String modify(BoardVO board, Criteria cri, RedirectAttributes rttr) {
			
			log.info("수정데이터 : " + board);
			log.info("Criteria" + cri);
			// db 저장
			boardService.modify(board);
			
			// 검색과 페이지정보를 이동주소(/board/list)의 파라미터로 사용하기 위한 작업
//			rttr.addAttribute("pageNum", cri.getPageNum());
//			rttr.addAttribute("Amount", cri.getAmount());
//			rttr.addAttribute("Type", cri.getType());
//			rttr.addAttribute("Keyword", cri.getKeyword());
			
			// /board/list?pageNum=값&amount=10&Type=값&keyword=값
			return "redirect:/board/list" + cri.getListLink(); // list(Criteria cri, Model model)
		}
		
		// 게시물삭제
		@GetMapping("/delete")
		public String delete(@RequestParam("bno") Long bno, Criteria cri, RedirectAttributes rttr) {
			log.info("삭제할 번호 " + bno);
			
			//db 작업
			boardService.delete(bno);
			
//			rttr.addAttribute("pageNum", cri.getPageNum());
//			rttr.addAttribute("Amount", cri.getAmount());
//			rttr.addAttribute("Type", cri.getType());
//			rttr.addAttribute("Keyword", cri.getKeyword());
			
			return "redirect:/board/list" + cri.getListLink();
		}
		
}
