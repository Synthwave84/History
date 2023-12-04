package com.docmall.demo.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	/*
	 * CREATE TABLE BOARD (
    BNO NUMBER, -- 글번호
    TITLE       VARCHAR2(100)   NOT NULL,   -- 제목
    CONTENT     VARCHAR2(1000)  NOT NULL,   -- 내용
    WRITER      VARCHAR2(100)   NOT NULL,   -- 작성자
    REGDATE     DATE    DEFAULT SYSDATE,    -- 등록일
    UPDATEDDATE DATE DEFAULT SYSDATE,       -- 수정일
    CONSTRAINT PK_BOARD PRIMARY KEY(BNO)
);
	 */
	// 클래스는 필드, getter/setter, toString() 으로 구성한다.
	// 테이블명과 클래스명은 동일하지 않아도 된다.
	// 컬럼명의 타입과 필드의 타입명은 맞는 타입을 사용해야 한다.
	// 테이블의 컬럼명과 클래스의 필드명을 일치시킨다.(권장)
	// 테이블의 컬럼명과 클래스의 필드명 다르게 해서 작업도 가능하다.
	
	private Long bno;
	private String title;
	private String content;
	private String writer;
	
	private Date regdate;
	private Date updateddate;
	
	private int	viewcount;
	
}
