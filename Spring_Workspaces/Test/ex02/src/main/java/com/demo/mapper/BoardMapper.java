package com.demo.mapper;



import java.util.List;

import com.demo.domain.BoardVO;
import com.demo.domain.Criteria;
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
	
	public void readCount(Long bno);
	
//	글 수정 폼
	public void modify(BoardVO board);
//	글 수정하기 
	
//	목록 = 여러개
//	데이터가 여러개 이기 때문에, 리스트 컬렉션을 이용한다.
//	데이터베이스의 내용을 클라이언트로 전달(return)해줘야 하기 때문에 리턴이 있어야한다.
//	추상메소드에는 몸체{} 가 없다. 
//	전체목록. 여러개 List<BoardVO>리턴 값
	public List<BoardVO> getList();
	
//	페이징 목록, 여러개List<BoardVO> 리턴값.
//	pageNum,amount, Type, keyword 모두 사용
	public List<BoardVO> getListWithPaging(Criteria cri);
	
//	전체 데이터 갯수 (검색 포함)
//	내부에는 type, keyword만 사용한다.
	public int getTotalCount(Criteria cri);
	
//	글 삭제하기
	
	public void delete(Long bno);
}
