package com.demo.mapper;

import java.util.List;

import com.demo.domain.BoardVO;
//	인터페이스
//	BoardMapper인터페이스와 BoardMapper.XML은 하나로 관리된다.
public interface BoardMapper {

	
//	추상 메소드
	
//	글쓰기 저장
//	메서드명과 id="register" 일치 <insert id="register"></insert>
	public void register(BoardVO board);
//	글 수정 폼
	
//	글 수정하기 
	
//	목록
//	데이터가 여러개 이기 때문에, 리스트 컬렉션을 이용한다.
	public List<BoardVO> getList();
//	글 삭제하기
}
