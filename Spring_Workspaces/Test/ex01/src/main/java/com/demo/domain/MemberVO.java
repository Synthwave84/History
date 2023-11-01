package com.demo.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//	오라클에서 Member 테이블을 생성하여 회원 테이블이 된다.

@Getter
@Setter
@ToString

public class MemberVO {
	private String userID;
	private String passwd;
	private String addr;
	private int age;
}
