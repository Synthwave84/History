package com.demo.service;



import java.util.List;

import com.demo.domain.BoardVO;
import com.demo.domain.Criteria;

// 인터페이스는  @Service 애노테이션 사용 안함.
public interface BoardService {
	
	public void register(BoardVO board);
	
	public List<BoardVO> getList();
	
	public List<BoardVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
	public BoardVO get(Long bno);
	
	public void modify(BoardVO board);
	
	public void delete(Long bno);
	
	
}
