package com.demo.service;



import java.util.List;

import com.demo.domain.BoardVO;
import com.demo.domain.Criteria;

<<<<<<< HEAD
// 인터페이스는  @Service 애노테이션 사용 안함.
public interface BoardService {
	
	public void register(BoardVO board);
	
	public List<BoardVO> getList();
	
	public List<BoardVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
=======
//	인터페이스에선 어노테이션 사용 하지 않음.
public interface BoardService {
	public void register(BoardVO board);
//	BoardMapper 인터페이스의 register 메소드 호출
	
	public List<BoardVO> getList();
	public List<BoardVO> getListWithPaging(Criteria cri);
	
>>>>>>> 967ebdd261254dcf2b4a04c05b4622a31c2ee409
	
	public BoardVO get(Long bno);
	
	public void modify(BoardVO board);
	
	public void delete(Long bno);
	
<<<<<<< HEAD
=======
	public int getTotalCount(Criteria cri);
	 

	
>>>>>>> 967ebdd261254dcf2b4a04c05b4622a31c2ee409
	
}
