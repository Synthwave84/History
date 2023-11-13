package com.demo.domain;

import lombok.Getter;
import lombok.ToString;

<<<<<<< HEAD
// 페이징기능 목적클래스.   [prev] 1	 2	3	4	5	6	7	8	9	10 [next]

@Getter
@ToString
public class PageDTO {

	private int startPage; // 각 블럭에서 출력할 시작페이지번호
	private int endPage;  // 각 블럭에서 출력할 종료페이지번호
	
	private boolean prev, next; // 이전, 다음 표시여부
	
	private int total; // 테이블의 데이타 총 개수.
	
	private Criteria cri; // 1)페이징 :pageNum, amount   2)검색: type, keyword
	
	public PageDTO(Criteria cri, int total) {
		
		/* 나머지가 존재하면,  페이지 1개 필요
		  1)
		  total : 13개
		  amount : 5개
		  페이지 수 : 3
		  나머지가 존재 안하면, 페이지 1개 불필요.
		  2)
		  total : 10개
		  amount : 5개
		  페이지 수 : 2
		  
		 */
		
		
		this.cri = cri; // 1)검색조건이 없을 경우 pageNum=1, amount=10, type=null, keyword=null
		this.total = total;
		
		int pageSize = 10; // 블럭에 보여줄 페이지번호의 개수.  1 2 3 4 5 6 7 8 9 10
		int endPageInfo = pageSize - 1; // 9
		
		// this.endPage = (int) (Math.ceil(10 / 10.0)) * 10;
		this.endPage = (int) (Math.ceil(cri.getPageNum() / (double) pageSize)) * pageSize;
		
		// this.startPage = 10 - 9;
		this.startPage = this.endPage - endPageInfo;
		                               
		// int readEnd = (int) (Math.ceil((13 * 1.0) /5));
		int readEnd = (int) (Math.ceil((total * 1.0) /cri.getAmount()));
		
		if(readEnd <= this.endPage) {
			this.endPage = readEnd;
=======
@Getter
@ToString

//	페이징 기능 목적 클래스. [prev] 1 2 3 4 5 [next]
public class PageDTO {
	
//	각 블럭에서 출력할 시작 페이지 번호
	private int startPage;
//	각 블럭에서 출력할 종료 페이지 번호
	private int endPage;
//	이전 다음 표시여부
	private boolean prev, next;
//	테이블의 데이터 총 갯수
	private int 	total;
	
//	Criteria클래스를 멤버로 사용.
//	1)페이징 : pageNum, amount 2)검색 type, keyword
	private Criteria cri;
	
	public PageDTO(Criteria cri, int total) {
	/* 
		1) 나머지가 존재하면, 페이지 1개가 필요
		total : 13개
		amount : 5개
		페이지수 : 3
		
		2) 나머지가 존재하지 않으면 페이지 1개 불필요
		total :  10깨
		amount : 5개
		페이지수 :  2
		
	*/
		this.cri = cri;
		this.total = total;
//		한 블록에 표시해줄 페이지 번호의 갯수. 1 2 3 4 5 ... 10
		int pageSize = 10;
		// this.startPage = 10 - 9;
		int endPageInfo = pageSize - 1;
		
//		this.endPage = (int) (Math.ceil(1 / 10.0)) *10; <<무조건 소숫점으로 나오기 때문에 올림(ceil)하여 
//		최종값은 무조건 10이 된다
		this.endPage = (int) (Math.ceil(cri.getPageNum() / (double) pageSize)) * pageSize;
		
//		this.startPage = 10-9;
		this.startPage = this.endPage - endPageInfo;
//		int read End= (int) (math.ceil((13 * 1.0) / 5));
//		= 2.6 ceil 3.0 = int 3 
		int readEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));
		
		if(readEnd <= this.endPage) {
			this.endPage =readEnd;
>>>>>>> 967ebdd261254dcf2b4a04c05b4622a31c2ee409
		}
		
		this.prev = this.startPage > 1;
		
		this.next = this.endPage < readEnd;
<<<<<<< HEAD
		
		// cri : pageNum=1, amount=10, type=null, keyword=null
		// pageSize, startPage, endPage, prev, next
=======

// 		pageNum=1, amount=10, type=null, keyword=null		
// 		pageSize, startPage, endPage, prev, next
		
		
>>>>>>> 967ebdd261254dcf2b4a04c05b4622a31c2ee409
	}
	
}
