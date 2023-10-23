package com.docmall.domain;

import java.util.Date;

import lombok.Data;


//	보낼 자료를 데이터로 변경할 롬복 Data 어노테이션
//	이것을 설정 하지 않아, ERROR: jdbc.sqlonly - 1. PreparedStatement.setNull(1, 1111) java.sql.SQLException: 부적합한 열 유형: 1111
//	확인 방법 = INFO : com.docmall.web.BoardController - 레지스터 등록 목록com.docmall.domain.SBoardVO@4f301854
//	상단에서 볼 수 있듯 로그에 들어가야 할 내용들이 아니라, 메모리 주소가 로거에 확인됨을 알 수 있었음.

//	1) 보낼 자료가 데이터 이므로, 데이터 화 시키는 작업이 필수로 동반 되어야 한다.
@Data
public class SboardVO {
	
//	-- SBoard에서 사용할 테이블
//
//	CREATE TABLE SBOARD (
//			  
//		    IDX         NUMBER,                             -- 글번호
//		    SUBJECT     VARCHAR2(100)   NOT NULL,           -- 제목
//		    CONTENT     VARCHAR2(1000)  NOT NULL,           -- 내용
//		    AUTHOR      VARCHAR2(100)   NOT NULL,           -- 작성자
//		    CREATEDATE  DATE            DEFAULT SYSDATE,    -- 등록일
//		    MODIFYDATE  DATE            DEFAULT SYSDATE,    -- 수정일
//		    READCOUNT   NUMBER,          
//		    CONSTRAINT  PK_SBOARD       PRIMARY KEY(IDX)
//		);
	
//	2) SBoard에서 사용할 VO데이터
	
	private Long 	idx;
	private String 	subject;
	private String 	content;
	private String 	author;
	private Date   	createdate;
	private Date   	modifydate;
	private int	   	readcount;
}
