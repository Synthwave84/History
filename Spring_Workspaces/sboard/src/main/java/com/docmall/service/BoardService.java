package com.docmall.service;

import java.util.List;

import com.docmall.domain.Criteria;

import com.docmall.domain.SboardVO;

public interface BoardService {
	
//	글 쓰기
//	1) register 메소드 서비스에 연결 
	public void register(SboardVO board);
	
	
//	글 목록 + 검색 + 페이징
//	2) getList 메소드 서비스에 연결
	public List<SboardVO> getList();
	
//	3) getTotalCount 메소드 서비스 연결
	public int getTotalCount(Criteria cri);
	
//	4) getListWithPage 메소드 서비스 연결
	public List<SboardVO> getListWithPage(Criteria cri);
	
//	5) get 메소드 서비스 연결
	public SboardVO get(Long idx);
	
//	6) modify 메소드 서비스 연결
	public void modify(SboardVO board);
	
//	7) delete 메소드 서비스 연결
	public void delete(Long idx);
}
