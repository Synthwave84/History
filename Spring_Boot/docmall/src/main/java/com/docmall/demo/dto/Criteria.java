package com.docmall.demo.dto;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

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
				
	}
	
}
