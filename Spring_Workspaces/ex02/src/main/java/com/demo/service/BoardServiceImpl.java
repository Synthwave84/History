package com.demo.service;



import java.util.List;

import org.springframework.stereotype.Service;

import com.demo.domain.BoardVO;
import com.demo.domain.Criteria;
import com.demo.mapper.BoardMapper;

import lombok.RequiredArgsConstructor;


<<<<<<< HEAD

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
		
=======
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
>>>>>>> 967ebdd261254dcf2b4a04c05b4622a31c2ee409
	}

	@Override
	public List<BoardVO> getList() {
<<<<<<< HEAD

=======
>>>>>>> 967ebdd261254dcf2b4a04c05b4622a31c2ee409
		return boardMapper.getList();
	}

	@Override
	public BoardVO get(Long bno) {
<<<<<<< HEAD
		//조회수 증가
		boardMapper.readCount(bno);
=======
		
//		조회수 증가 작업
		boardMapper.readCount(bno);
		
>>>>>>> 967ebdd261254dcf2b4a04c05b4622a31c2ee409
		return boardMapper.get(bno);
	}

	@Override
	public void modify(BoardVO board) {
<<<<<<< HEAD
	
		boardMapper.modify(board);
=======
		// TODO Auto-generated method stub
		boardMapper.modify(board);
		
>>>>>>> 967ebdd261254dcf2b4a04c05b4622a31c2ee409
	}

	@Override
	public void delete(Long bno) {
<<<<<<< HEAD
	
		boardMapper.delete(bno);
=======
		boardMapper.delete(bno);
		
>>>>>>> 967ebdd261254dcf2b4a04c05b4622a31c2ee409
	}

	@Override
	public List<BoardVO> getListWithPaging(Criteria cri) {
<<<<<<< HEAD

		return boardMapper.getListWithPaging(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {

=======
		return boardMapper.getListWithPaging(cri);
	}



	@Override
	public int getTotalCount(Criteria cri) {
		
>>>>>>> 967ebdd261254dcf2b4a04c05b4622a31c2ee409
		return boardMapper.getTotalCount(cri);
	}

	

<<<<<<< HEAD
}
=======
	





	
	
}



>>>>>>> 967ebdd261254dcf2b4a04c05b4622a31c2ee409
