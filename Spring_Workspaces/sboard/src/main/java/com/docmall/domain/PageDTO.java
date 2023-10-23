package com.docmall.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString

//	페이징 기능을 위해 생성하는 클래스.
//	DTO 는 페이징을 위한 목적으로 사용되므로, 페이징 관련한 기능은 DTO를 이용하여 작업한다.
public class PageDTO {
	
//	각 블럭에서 출력할 시작 페이지 번호
	private int stPage;
//	각 블럭에서 출력할 종료 페이지 번호
	private int edPage;
//	이전 다음 표시여부
	private boolean prev, next;
//	테이블의 데이터 총 갯수
	private int 	total;
	
//	Criteria클래스를 멤버로 사용.
//	1) 페이징 관련 기능 : pgNum, amount 
//	2) 검색관련 기능 : type, keyword
	private Criteria cri;
	
	public PageDTO(Criteria cri, int total) {

		this.cri = cri;
		this.total = total;
//		한 블록에 표시해줄 페이지 번호의 갯수. 1 2 3 4 5 ... 10
		int pageSize = 10;
		// this.startPage = 10 - 9;
		int endPageInfo = pageSize - 1;
		
//		this.endPage = (int) (Math.ceil(1 / 10.0)) *10; <<무조건 소숫점으로 나오기 때문에 올림(ceil)하여 
//		최종값은 무조건 10이 된다
		this.edPage = (int) (Math.ceil(cri.getPgNum() / (double) pageSize)) * pageSize;
		
//		this.startPage = 10-9;
		this.stPage = this.edPage - endPageInfo;
//		int read End= (int) (math.ceil((13 * 1.0) / 5));
//		= 2.6 ceil 3.0 = int 3 
		int readEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));
		
		if(readEnd <= this.edPage) {
			this.edPage =readEnd;
		}
		
		this.prev = this.stPage > 1;
		
		this.next = this.edPage < readEnd;

		
	}
	
}