package com.demo.domain;

import lombok.Getter;
import lombok.ToString;

// 페이지 번호, 이전, 다음 버튼 등 페이지 기능을 만들기 위한 목적 클래스
// ex ) [prev]  1  2  3  4  5  [next]

@Getter
@ToString
public class PageDTO {

	private int startPage; // 각 블럭에서 출력할 시작페이지 번호
	private int endPage; // 각 블럭에서 출력할 마지막 페이지 번호
	
	private boolean prev, next; // 이전과 다음 표시 여부
	
	private int total; // 테이블의 데이터 총 갯수
	
	private Criteria cri; // 1) 페이징 : pageNum, amount  2) 검색 : type, keyword
	
	public PageDTO(Criteria cri, int total) {
		
		/*
		 나머지가 존재하면 페이지 하나가 필요하게 된다.
		 1)
		 total : 데이터가 13개라고 가정
		 amount : 5개
		 page 수 = 3
		 
		 나머지가 존재하지 않으면 더이상 페이지가 필요하지 않다.
		 2)
		 total : 데이터가 10개라고 가정
		 amount : 5개
		 page 수 = 2
		 */
		this.cri = cri; // 1) 검색조건이 없을 경우 // Criteria(pageNum=1, amount=10, type=null, keyword=null)

		this.total = total;
		
		int pageSize = 10; // 블럭에 보여줄 페이지 번호 갯수
		int endPageInfo = pageSize -1; // endPageInfo = 9;
		
		// this.endPage = (int) (Math.ceil(1 / 10.0)) * 10;
		// 알고리즘에 의해 1~10 까지중 어느 번호르 선택하여도 10의 결과값을 가진다?
		this.endPage = (int) (Math.ceil(cri.getPageNum() / (double) pageSize)) * pageSize;
		
		// this.startPage = 10 - 9;
		this.startPage = this.endPage - endPageInfo;
		
		// int readEnd = (int) (Math.ceil((13 * 1.0) / 5 ));
		int readEnd = (int) (Math.ceil((total * 1.0) /cri.getAmount()));
		
		if(readEnd <= this.endPage) {
			this.endPage = readEnd;
		}
		
		this.prev = this.startPage > 1;
		
		this.next = this.endPage < readEnd;
		
		// pageNum=1, amount=10, type=null, keyword=null
		// pageSize, startPage, endPage, prev, next

	}
}
