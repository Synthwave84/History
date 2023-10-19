package com.demo.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

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
	
}
