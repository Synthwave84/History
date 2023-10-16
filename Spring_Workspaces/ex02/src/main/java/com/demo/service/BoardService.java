package com.demo.service;

import java.util.List;

import com.demo.domain.BoardVO;

//	인터페이스에선 어노테이션 사용 하지 않음.
public interface BoardService {
	public void register(BoardVO board);
//	BoardMapper 인터페이스의 register 메소드 호출
	
	public List<BoardVO> getList();
	
}
