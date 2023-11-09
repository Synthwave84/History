package com.docmall.mapper;

import java.util.List;

import com.docmall.domain.Criteria;
import com.docmall.domain.SboardVO;

public interface BoardMapper {
	
//	1) register(글등록) 작업.
//		- 서버와 정상적으로 통신 하고 있는지 기본적인 값이 전달 되는지를 테스트 하기 위함.
	public void register(SboardVO board);
	
//	2) list(글목록)작업.
//		- 다음 페이지인 list페이지를 불러오기 위한 작업.
//		- 넣어야 할 자료가 많으므로 콜렉션인 리스트를 이용
	
//	페이지에 보여줄 게시글 목록 작업
	public List<SboardVO> getList();
//	총 데이터 갯수 작업
	public int getTotalCount(Criteria cri);
//	페이징 기넝 구현을 위한 작업
	public List<SboardVO> getListWithPage(Criteria cri);
//	조회수 작업
	public void readCount(Long idx);
	
//	3) get(글읽기 작업)
	public SboardVO get(Long idx);
	
//	4) modify(글 수정 작업)
	public void modify(SboardVO board); 
	
//	5) delete(글 삭제 작업)
	public void delete(Long idx);
	
}



