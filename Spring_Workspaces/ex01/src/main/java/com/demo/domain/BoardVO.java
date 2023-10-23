package com.demo.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardVO {

//	작성자
	private String writer;
//	글제목
	private String title;
//	내용
	private String content;
}
