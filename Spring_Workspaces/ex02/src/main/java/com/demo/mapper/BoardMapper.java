package com.demo.mapper;

import java.util.List;

import com.demo.domain.BoardVO;
import com.demo.domain.Criteria;

// 인터페이스
// BoardMapper interface와 BoardMapper.xml은 하나로 관리된다.

/*
 root-context.xml파일
   <mybatis-spring:scan base-package="com.demo.mapper" />
   위 구문을 수동으로 추가해야 한다.
 */

// 하나만 가져올때는 return type을 BoardVO로 하지만
// 여러개일 경우 List를 사용해 List<BoardVO>로 가져온다.
public interface BoardMapper {

	// 추상메도스
	// 메소드명과 id="register" 일치 <insert id="register"></insert>
	// 글쓰기 저장
	public void register(BoardVO board);
	
	// 게시물 읽기 // 글수정 폼
	public BoardVO get(Long bno);
	
	// 조회수 증가
	public void readCount(Long bno);
	
	// 글수정하기
	public void modify(BoardVO board);
	
	// 전체목록. 여러개 List<BoardVO> 리턴값, pageNum, amount, type, keyword
	public List<BoardVO> getList();
	// BoardMapper.xml 의 select문이 실행되면 List<BoardVO>에 넘겨준다.
	
	// 페이징 목록
	public List<BoardVO> getListWithPaging(Criteria cri);
	
	// 테이블 총 데이터 갯수(검색 포함 )
	public int getTotalCount(Criteria cri); // type, keyword
	
	// 글삭제하기
	public void delete(Long bno);
	
}
