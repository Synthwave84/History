package com.demo.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

// 페이징 및 검색 필드를 가지고 있는 클래스

@ToString
@Setter
@Getter
public class Criteria {

	private int pageNum; // 선택된 페이지 번호를 저장할 필드
	private int amount; // 페이지마다 출력할 게시물 개수
	
	private String type; // 검색종류(게시글 + 댓글, 제목만, 글작성자 등)
	private String keyword; // 검색어(사용자가 적은 키워드를 포함한 게시글 등)
	
	// 기본 생성자
	public Criteria() {
		this(1, 10);
		System.out.println("Criteria 기본생성자 호출");
	}
	
	// 매개변수가 있는 생성자를 생성하면 기본생성자는 자동생성되지 않는다.
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	// type값 - T C W, TC, TW, TWC를 배열로 받기위한 메소드 (boardMapper.xml에서 getType() 대신 사용)
	public String[] getTypeArr() {
		
		return type == null? new String[] {} : type.split(""); // split이 진행되면 복합조건 검색시 {"T", "W", "C"}
		// return type이 널이 아니면? 새로운 문자열 배열 생성
	}
	
	// UriComponentsBuilder : 여러개의 파라미터들을 연결하여 URL형태로 만들어주는 기능
	// ?pageNum=값&amount=10&Type=값&keyword=값 < 를 만드는 작업
	public String getListLink() {
		
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.pageNum) // field로도 가져올 수 있다.(class 내에서는 접근자가 효력이 없기 때문)
				.queryParam("amount", this.getAmount()) // getter로도 가져올 수 있다.
				.queryParam("type", this.type)
				.queryParam("keyword", this.keyword);
		
		return builder.toUriString();
	}
}
