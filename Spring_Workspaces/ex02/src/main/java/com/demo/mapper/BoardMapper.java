package com.demo.mapper;



import java.util.List;

import com.demo.domain.BoardVO;
//	인터페이스
//	BoardMapper인터페이스와 BoardMapper.XML은 하나로 관리된다.
public interface BoardMapper {

	
//	추상 메소드
	
//	글쓰기 저장
//	메서드명과 id="register" 일치 <insert id="register"></insert>
//	여기서 register 추상 클래스를 제작.
	public void register(BoardVO board);
	
//	게시물 보기 또는 수정 폼= 1깨 
	public BoardVO get(Long bno);
	
//	글 수정 폼
	public void modify(BoardVO board);
//	글 수정하기 
	
//	목록 = 여러개
//	데이터가 여러개 이기 때문에, 리스트 컬렉션을 이용한다.
//	데이터베이스의 내용을 클라이언트로 전달(return)해줘야 하기 때문에 리턴이 있어야한다.
//	추상메소드에는 몸체{} 가 없다. 
	public List<BoardVO> getList();
//	글 삭제하기
	
	public void delete(Long bno);
}
