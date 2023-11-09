package com.docmall.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.docmall.domain.Criteria;

import com.docmall.domain.SboardVO;
import com.docmall.mapper.BoardMapper;

import lombok.RequiredArgsConstructor;

//	1) 서비스 어노테이션 작업
@Service
//	2) 컨스트럭터 작업.
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService {
	
//	DataImplements
	private final BoardMapper boardMapper;
	
//	1) 레지스터 등록
	@Override
	public void register(SboardVO board) {
		boardMapper.register(board);
	}
	
//	2) getList 등록
	@Override
	public List<SboardVO> getList() {
		
		return boardMapper.getList();
	}
	
//	3) 
	@Override
	public int getTotalCount(Criteria cri) {
	
		return boardMapper.getTotalCount(cri);
	}
	
//	3) getListWithPage 등록
	@Override
	public List<SboardVO> getListWithPage(Criteria cri) {
		
		return boardMapper.getListWithPage(cri);
	}

	
	@Override
	public SboardVO get(Long idx) {
		boardMapper.readCount(idx);
		return boardMapper.get(idx);
	}

	@Override
	public void modify(SboardVO board) {
		boardMapper.modify(board);
		
	}

	@Override
	public void delete(Long idx) {
		boardMapper.delete(idx);
		
	}



}
