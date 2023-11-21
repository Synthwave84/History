package com.demo.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {

	/*
	CREATE TABLE BOARD (
    BNO             NUMBER, -- 글번호
    TITLE           VARCHAR2(100)   NOT NULL, -- 글제목
    CONTENT         VARCHAR2(1000)  NOT NULL, -- 글내용
    WRITER          VARCHAR2(100)   NOT NULL, -- 작성자
    REGDATE         DATE    DEFAULT SYSDATE, -- 등록일
    UPDATEDDATE     DATE    DEFAULT SYSDATE, -- 수정일
    CONSTRAINT PK_BOARD PRIMARY KEY(BNO)
	 */
	
	/*
		- 클래스는 필드, getter/setter, toString()으로 구성한다.
		- 테이블의 컬럼명과 클래스의 필드명을 일치시킨다.(권장)
		- 테이블의 컬럼명과 클래스의 필드명을 다르게 해서 작업도 가능은 하다.(테이블명과 클래스명은 동일하지 않아도 된다.)
		- 테이블의 데이터타입과 필드의 데이터타입은 일치해야한다.
	 */
	
	// PRIMARY KEY에 해당하는 테이블에는 참조타입을 쓴다.
	private Long bno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private Date updateddate;
	private int viewcount;
}
