package com.docmall.domain;
import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter

//	페이징 및 검색 필드를 가지고 있는 클래스.
public class Criteria {
//	pageNum 선택 된 페이지 번호 저장 1, 2, 3, etc
	private int pgNum;
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
	
	public Criteria (int pgNum, int amount) {
		this.pgNum = pgNum;
		this.amount = amount;
	}
//	getType() 메소드 대신 boardMapper.xml에서 사용할 메소드
//	type; 검색종류. S,A,C 6개중 선택
	public String[] getTypeArr() {
//		type이 "SAC"면, ("S","A","C")
		return type == null? new String[] {} : type.split("");
	}
//	UriComponentsBuilder :여러개의 파라미터들을 연결하여 URL형태로 만들어 주는 기능

	public String getListLink() {
		
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
//				Getter 때문에 필드값, 겟값 둘다 사용 가능하다.
				.queryParam("pgNum", this.pgNum)
				.queryParam("amount", this.amount)
				.queryParam("type", this.getType())
				.queryParam("keyword", this.getKeyword());
		
		return builder.toUriString();
	}
	
}