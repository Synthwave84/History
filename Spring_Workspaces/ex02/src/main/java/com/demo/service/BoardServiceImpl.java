package com.demo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.demo.domain.BoardVO;
import com.demo.domain.Criteria;
import com.demo.mapper.BoardMapper;

import lombok.RequiredArgsConstructor;

/*
 root-context.xml 에
 	<context:component-scan base-package="com.demo.service" />
 위의 구문 수동 추가
 */

// 구현클래스는 인터페이스를 상속시 추상메소드를 반드시 재정의 해야 한다.
// BoardMapper 인터페이스의 추상메서드를 호출하는 작업을 해야한다.

@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService {
	
	// Spring이 BoardMapper 인터페이스를 참조하도록 주입해준다(DI(Dependency Injection))
	
	private final BoardMapper boardMapper;

	/* 
	 public BoardServiceImpl(BoardMapper boardMapper) {
	 	this.boardMapper = boardMapper;
	 }
	 */
	
		// BoardMapper의 interface 호출
	@Override
	public void register(BoardVO board) {
		boardMapper.register(board);
	}

	@Override
	public List<BoardVO> getList() {
		return boardMapper.getList();
	}

	@Override
	public BoardVO get(Long bno) {
		
		// 조회수 증가 작업
		boardMapper.readCount(bno);
		
		return boardMapper.get(bno);
	}

	@Override
	public void modify(BoardVO board) {
		boardMapper.modify(board);
	}

	@Override
	public void delete(Long bno) {
		boardMapper.delete(bno);
	}

	@Override
	public List<BoardVO> getListWithPaging(Criteria cri) {
		return boardMapper.getListWithPaging(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		return boardMapper.getTotalCount(cri);
	}


	/*
	 lombok에서 제공하는 @RequiredArgsConstructor annotation을 사용하면
	 private final BoardMapper boardMapper; 필드를 내용으로 하는 매개변수가 있는 생성자가 만들어진다.
	 또, 만들어진 생성자로 인해 BoardMapper 인터페이스의 bean이 주입된다.
	 */
}
