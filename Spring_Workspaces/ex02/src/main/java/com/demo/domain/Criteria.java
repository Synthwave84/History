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
	
}
