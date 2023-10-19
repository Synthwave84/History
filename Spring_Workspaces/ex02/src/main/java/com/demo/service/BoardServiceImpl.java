package com.demo.service;



import java.util.List;

import org.springframework.stereotype.Service;

import com.demo.domain.BoardVO;
import com.demo.domain.Criteria;
import com.demo.mapper.BoardMapper;

import lombok.RequiredArgsConstructor;


//	root-context.xml파일에
//	<context:component-scan base-package="com.demo.service" /> 부분을 수동으로 추가하여야 한다.
//	구현클래스는 인터페이스를 상속시 추상메소드를 반드시 재정의 해야만한다. (문법 규칙)
//	BoardMapper인터페이스의 추상 메서드를 호출하는 작업을 한다.
@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService {
	
//	스프링이 BoardMapper인터페이스를 참조하도록 주입한다.(DI)
//	즉 BoardMapper의 내용 전부를 주입 해주는 것이다. 
	private final BoardMapper boardMapper;
	/*
	public BoardServiceImpl(BoardMapper boardMapper) {
		this.boardMapper = boardMapper;
	} << Lombok이 자동 생성해줌
	*/
	
	/*
	롬복에서 제공하는 @RequiredArgsConstructor 어노테이션 덕분에
	private final BoardMapper boardMpaaer; 필드를 내용으로 하는
	생성자가 만들어진다.
	그리고, 그 생성자로 인하여, BoardMapper인터페이스의 bean이 주입된다.
	*/

	
	@Override
	public void register(BoardVO board) {
//		BoardMapper 인터페이스의 register 메소드 호출
		boardMapper.register(board);
	}

	@Override
	public List<BoardVO> getList() {
		return boardMapper.getList();
	}

	@Override
	public BoardVO get(Long bno) {
		return boardMapper.get(bno);
	}

	@Override
	public void modify(BoardVO board) {
		// TODO Auto-generated method stub
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

	

	





	
	
}



