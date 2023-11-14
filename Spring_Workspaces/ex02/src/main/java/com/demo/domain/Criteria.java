package com.demo.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

<<<<<<< HEAD
//페이징및검색 필드를 가지고 있는 클래스

@ToString
@Setter
@Getter
public class Criteria {
	
	private int pageNum; // 선택된 페이지 번호  1	 2	3	4	5
	private int amount; // 페이지마다 출력할 게시물 개수
	
	private String type;  // 검색종류.  T C W  TC TW  TWC
	private String keyword; // 검색어
	
	public Criteria() {
		this(1, 10);
		System.out.println("Criteria 기본생성자 호출");
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	// getType() 메서드대신 boardMapper.xml에서 사용할 메서드
	// type;  검색종류.  T  C  W  TC  TW  TWC  6개중 선택
	public String[] getTypeArr() {
		
		// type 이 "TWC"면,  {"T", "W", "C"}
		return type == null? new String[] {} : type.split("");
	}
	
	// UriComponentsBuilder : 여러개의 파라미터들을 연결하여 URL형태로 만들어주는 기능
	// ?pageNum=값&amount=값&type=값&keyword=값
	public String getListLink() {
		
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.pageNum)
				.queryParam("amount", this.amount)
				.queryParam("type", this.type)
				.queryParam("keyword", this.keyword);
		
		return builder.toUriString();
				
=======
@ToString
@Setter
@Getter

//	페이징 및 검색 필드를 가지고 있는 클래스.
public class Criteria {
//	pageNum 선택 된 페이지 번호 저장 1, 2, 3, etc
	private int pageNum;
//	amount 페이지 마다 출력할 게시물 갯수.
	private int amount;
	
//	type 검색종류. ex) 게시글 or 작성자 같은것
//	검색종류. T C W TW TC TCW
	private String type; 
//	keyword 검색어
	private String keyword;

	public Criteria() {
		this (1, 10);
		System.out.println("Criteria 기본 생성자 호출");
	}
	
	public Criteria (int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
//	getType() 메소드 대신 boardMapper.xml에서 사용할 메소드
//	type; 검색종류. T C W TC TW TWC 6개중 선택
	public String[] getTypeArr() {
//		type이 "TWC"면, ("T","W","C")
		return type == null? new String[] {} : type.split("");
	}
//	UriComponentsBuilder :여러개의 파라미터들을 연결하여 URL형태로 만들어 주는 기능
//	?pageNum=값&amount=값&type=값&keyword=값
	public String getListLink() {
		
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
//				Getter 때문에 필드값, 겟값 둘다 사용 가능하다.
				.queryParam("pageNum", this.pageNum)
				.queryParam("amount", this.amount)
				.queryParam("type", this.getType())
				.queryParam("keyword", this.getKeyword());
		
		return builder.toUriString();
>>>>>>> 967ebdd261254dcf2b4a04c05b4622a31c2ee409
	}
	
}
