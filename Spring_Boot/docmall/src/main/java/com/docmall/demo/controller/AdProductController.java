package com.docmall.demo.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.docmall.demo.domain.CategoryVO;
import com.docmall.demo.domain.ProductVO;
import com.docmall.demo.dto.Criteria;
import com.docmall.demo.dto.PageDTO;
import com.docmall.demo.service.AdCategoryService;
import com.docmall.demo.service.AdProductService;
import com.docmall.demo.util.FileUtils;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/admin/product/*")
@Controller
public class AdProductController {

	private final AdProductService adProductService;
	private final AdCategoryService adCategoryService;
	
	// 메인및썸네일 이미지업로드 폴더경로 주입작업
//	@Resource(name = "uploadPath") // servlet-context.xml 의 uploadPath bean이름 참조를 해야 함.
	@Value("${file.dir}")
	private String uploadPath;
	
	// CKEditor에서 사용되는 업로드 폴더경로
//	@Resource(name = "uploadCKPath") // servlet-context.xml 의 bean이름 참조를 해야 함.
	@Value("${file.ckdir}")
	private String uploadCKPath;
	
	//상품등록 폼
	@GetMapping("/pro_insert")
	public void pro_insert() {
		
		log.info("상품등록 폼");
	}
	
	// 1차카테고리 데이타를 Model로 작업
	/*
	@GetMapping("이름")
	public void aaa(Model model) {
		
		model.addAttribute("cg_code", "1차카테고리정보");
	}
	*/
	
	//상품정보 저장
	// 파일업로드 기능 : 1)스프링에서 내장된 기본라이브러리. servlet-context.xml 에서 MultipartFile 대한 bean등록작업 
	//              2)외부라이브러리(commons-fileupload)를 이용(pom.xml). servlet-context.xml 에서 MultipartFile 대한 bean등록작업 
	// MultipartFile uploadFile : <input type="file" class="form-control" name="uploadFile" id="uploadFile">
	// MultipartFile uploadFile 필드명과 input태그의 name="uploadFile" 이름이 일치.
	@PostMapping("/pro_insert")
	public String pro_insert(ProductVO vo, MultipartFile uploadFile, RedirectAttributes rttr) {
		
		log.info("상품정보: " + vo);
		
		//1)파일업로드 작업. 미리선수작업 : FileUtils 클래스작업
		String dateFolder = FileUtils.getDateFolder();
		String savedFileName = FileUtils.uploadFile(uploadPath, dateFolder, uploadFile);
		
		vo.setPro_img(savedFileName);
		vo.setPro_up_folder(dateFolder);
		
		log.info("상품정보: " + vo);
		
		//2)상품정보 저장
		adProductService.pro_insert(vo);
		
		
		return "redirect:/admin/product/pro_list"; // 상품리스트 주소이동
	}
	
	//CkEdiotr 업로드 탭에서 파일업로드시 동작하는 매핑주소
	// MultipartFile upload : 업로드된 파일을 참조하는 객체
	// MultipartFile upload 변수와 CKEditor의 <input type="file" name="upload" size="38">
	// HttpServletRequest 클래스 : jsp의request객체 클래스. 클라이언트의 요청을 담고 있는 객체
	// HttpServletResponse 클래스 : jsp의 response객체 클래스. 클라이언트로 보낼 서버측의 응답정보를 가지고 있는 객체.
	@PostMapping("/imageUpload")
	public void imageUpload(HttpServletRequest request, HttpServletResponse response, MultipartFile upload) {
		
		// try 코드 사용전에 선언한 목적
		OutputStream out = null;
		PrintWriter printWriter = null; // 클라이언트에게 서버의 응답정보를 보낼때 사용.
		
		//jsp파일
		/*
		 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
		 */
		
		// 클라이언트에게 보내는 응답설정
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		try {
			
			//1) 파일업로드 작업
			String fileName = upload.getOriginalFilename(); // 클라이언트에서 전송한 파일이름
			byte[] bytes = upload.getBytes(); // 업로드 한 파일을 byte배열로 읽어들임.
			
			String ckUploadPath = uploadCKPath + fileName;
			
			log.info("CKEditor파일경로: " + ckUploadPath);
			
			out = new FileOutputStream(new File(ckUploadPath)); // 0kb 파일생성.
			
			out.write(bytes); // 출력스트림작업
			out.flush();
			
			//2) 파일업로드 작업후 파일정보를 CKEditor로 보내는 작업
			printWriter = response.getWriter();
			
			// 브라우저의 CKEditor에서 사용할 업로드한 파일정보를 참조하는 경로설정. 
			// 1)톰캣 Context Path에서 Add External Web Module 작업을 해야 함.
			// Path : /ckupload, Document Base : C:\\dev\\upload\\ckeditor 설정
			// 2)Tomcat server.xml에서 <Context docBase="업로드경로" path="/매핑주소" reloadable="true"/>
			//  <Context docBase="C:\\dev\\upload\\ckeditor" path="/ckupload" reloadable="true"/>
			
			// CKeditor에서 업로드된 파일경로를 보내준다.(매핑주소와 파일명이 포함)
			String fileUrl = "/ckupload/" + fileName; 
			// {"filename":"abc.gif", "uploaded":1, "url":"/upload/abc.gif"}
			printWriter.println("{\"filename\":\"" +  fileName + "\", \"uploaded\":1,\"url\":\"" + fileUrl + "\"}");
			printWriter.flush();
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(out != null) {
				try {
					out.close();
				}catch(Exception ex) {
					ex.printStackTrace();
				}
			}
			if(printWriter != null) printWriter.close();
		}
	}
	
	//상품리스트.  (목록과페이징)
	@GetMapping("/pro_list")
	public void pro_list(Criteria cri, Model model) throws Exception {
		
		// this(1, 10);
		// 10 -> 2
		cri.setAmount(2);
		
		
		List<ProductVO> pro_list = adProductService.pro_list(cri);
		
		// 날짜폴더의 역슬래시를 슬래시로 바꾸는 작업.  이유? 역슬래시로 되어있는 정보가 스프링으로 보내는 요청데이타에 사용되면 에러발생.
		// 스프링에서 처리 안하면, 자바스크립에서 처리 할수도 있다.
		pro_list.forEach(vo -> {
			vo.setPro_up_folder(vo.getPro_up_folder().replace("\\", "/"));
		});
		model.addAttribute("pro_list", pro_list);
		
		int totalCount = adProductService.getTotalCount(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, totalCount));
	}
	
	//상품리스트에서 보여줄 이미지.  <img src="매핑주소">
	@ResponseBody
	@GetMapping("/imageDisplay") // /admin/product/imageDisplay?dateFolderName=값1&fileName=값2
	public ResponseEntity<byte[]> imageDisplay(String dateFolderName, String fileName) throws Exception {
		
		return FileUtils.getFile(uploadPath + dateFolderName, fileName);
	}
	
	//체크상품 목록 수정(ajax요청) 방법1
	// 일반요청:  배열형태로 파라미터가 전송되어오면.@RequestParam("pro_num_arr")  []를 제외
	@ResponseBody
	@PostMapping("/pro_checked_modify1")
	public ResponseEntity<String> pro_checked_modify1(
			@RequestParam("pro_num_arr[]") List<Integer> pro_num_arr,
			@RequestParam("pro_price_arr[]") List<Integer> pro_price_arr,
			@RequestParam("pro_buy_arr[]") List<String> pro_buy_arr
			) throws Exception {
		
		log.info("상품코드:" + pro_num_arr);
		log.info("가격:" + pro_price_arr);
		log.info("판매여부:" + pro_buy_arr);
		
		ResponseEntity<String> entity = null;


		//체크상품수정작업
		adProductService.pro_checked_modify1(pro_num_arr, pro_price_arr, pro_buy_arr);
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		return entity;
	}
	
	// 방법2
	@ResponseBody
	@PostMapping("/pro_checked_modify2")
	public ResponseEntity<String> pro_checked_modify2(
			@RequestParam("pro_num_arr[]") List<Integer> pro_num_arr,
			@RequestParam("pro_price_arr[]") List<Integer> pro_price_arr,
			@RequestParam("pro_buy_arr[]") List<String> pro_buy_arr
			) throws Exception {
		
		log.info("상품코드:" + pro_num_arr);
		log.info("가격:" + pro_price_arr);
		log.info("판매여부:" + pro_buy_arr);
		
		
		
		ResponseEntity<String> entity = null;


		//체크상품수정작업
		adProductService.pro_checked_modify2(pro_num_arr, pro_price_arr, pro_buy_arr);
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		return entity;
	}
	
	// 상품수정 폼 페이지
	@GetMapping("/pro_edit")
	public void pro_edit(@ModelAttribute("cri") Criteria cri, Integer pro_num, Model model) throws Exception {
		
		// 선택한 상품정보
		ProductVO productVO = adProductService.pro_edit(pro_num);
		// 역슬래시를 슬래시로 변환하는 작업.  ( \ -> / )
		// 요청 타겟에서 유효하지 않은 문자가 발견되었습니다. 유효한 문자들은 RFC 7230과 RFC 3986에 정의되어 있습니다.
		productVO.setPro_up_folder(productVO.getPro_up_folder().replace("\\", "/")); // Escape Sequence 특수문자.
		model.addAttribute("productVO", productVO);
		
		// 1차 전체카테고리 GlobalControllerAdvice 클래스 Model 참조.
		
		// 상품카테고리에서 2차카타고리를 이용한 1차카테고리 정보를 참조.
		// productVO.getCg_code() : 상품테이블에 있는 2차카테고리 코드
		CategoryVO firstCategory = adCategoryService.get(productVO.getCg_code());
		model.addAttribute("first_category",firstCategory);
		
		// 1차카테고리를 부모로 둔 2차카테고리 정보. 예> Top(1) : 
		// 현재상품의 1차카테고리 코드 : firstCategory.getCg_parent_code()
		model.addAttribute("second_categoryList", adCategoryService.getSecondCategoryList(firstCategory.getCg_prtcode()));
		
		
	}
	
	//상품수정
	@PostMapping("/pro_edit")
	public String pro_edit(Criteria cri, ProductVO vo, MultipartFile uploadFile, RedirectAttributes rttr) throws Exception {
		
		// 상품리스트에서 사용할 정보(검색,페이징정보)
		log.info("검색페이징정보" + cri);
		//상품수정내용
		log.info("상품수정내용" + vo);
		
		vo.setPro_up_folder(vo.getPro_up_folder().replace("/", "\\"));
		
		//작업
		// 파일이 변경될 경우 해야 할 작업  1)기존이미지 파일삭제  2) 업로드작업
		// 참고>클라이언트 파일명을 db에 저장하는 부분..
		// 첨부파일 확인할 때 조건식으로 사용:  uploadFile.getSize() > 0
		if(!uploadFile.isEmpty()) {
			
			//1)기존이미지파일삭제작업.
			FileUtils.deleteFile(uploadPath, vo.getPro_up_folder(), vo.getPro_img());
			
			//2)업로드작업
			String dateFolder = FileUtils.getDateFolder();
			String savedFileName = FileUtils.uploadFile(uploadPath, dateFolder, uploadFile);
			
			//3)db에 저장할 새로운 날짜폴더명및이미지명 변경작업.
			vo.setPro_img(savedFileName);
			vo.setPro_up_folder(dateFolder);
			
		}
		
		//db연동작업
		adProductService.pro_edit(vo);
		
		
		return "redirect:/admin/product/pro_list" + cri.getListLink();
	}
	
	@PostMapping("/pro_delete")
	public String pro_delete(Criteria cri, Integer pro_num) throws Exception {
		
		
		// db연동 작업
		adProductService.pro_delete(pro_num);
		
		return "redirect:/admin/product/pro_list" + cri.getListLink();
	}
	
	
}
