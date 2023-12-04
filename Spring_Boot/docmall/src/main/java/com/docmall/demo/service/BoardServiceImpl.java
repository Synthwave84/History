package com.docmall.demo.service;



import java.util.List;

import org.springframework.stereotype.Service;

import com.docmall.demo.domain.BoardVO;
import com.docmall.demo.dto.Criteria;
import com.docmall.demo.mapper.BoardMapper;

import lombok.RequiredArgsConstructor;



/*
 root-context.xml파일
 <context:component-scan base-package="com.demo.service" /> 수동추가
*/
//구현클래스는 인터페이스를 상속시 추상메서드를 반드시 재정의해야 한다.(문법규칙)
// BoardMapper인터페이스의 추상메서드를 호출하는 작업을 해야한다.
@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements  BoardService{

	//스프링이 BoardMapper인터페이스를 참조하도록 주입해준다.(DI)
	private final BoardMapper boardMapper;
	
	/*
	public BoardServiceImpl(BoardMapper boardMapper) {
		this.boardMapper = boardMapper;
	}
	*/
	
	/* 
	 롬복에서 제공하는 @RequiredArgsConstructor 애노테이션때문에 
	 private final BoardMapper boardMapper; 필드를 내용으로하는 매개변수가 있는  생성자가 만들어진다.
	 그리고, 그 생성자로 인하여, BoardMapper인터페이스의 bean이 주입된다.
	 */
	
	@Override
	public void register(BoardVO board) {
		
		// BoardMapper인터페이스의 register메서드 호출작업
		boardMapper.register(board);
		
	}

	@Override
	public List<BoardVO> getList() {
		// TODO Auto-generated method stub
		return boardMapper.getList();
	}

	@Override
	public BoardVO get(Long bno) {
		// TODO Auto-generated method stub
		
		//조회수 증가
		boardMapper.readCount(bno);
		
		return boardMapper.get(bno);
	}

	@Override
	public void modify(BoardVO board) {
		// TODO Auto-generated method stub
		boardMapper.modify(board);
	}

	@Override
	public void delete(Long bno) {
		// TODO Auto-generated method stub
		boardMapper.delete(bno);
	}

	@Override
	public List<BoardVO> getListWithPaging(Criteria cri) {
		// TODO Auto-generated method stub
		return boardMapper.getListWithPaging(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		// TODO Auto-generated method stub
		return boardMapper.getTotalCount(cri);
	}

	

}
