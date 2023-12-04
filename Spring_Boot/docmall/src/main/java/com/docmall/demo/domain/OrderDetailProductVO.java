package com.docmall.demo.domain;

import lombok.Data;

@Data
public class OrderDetailProductVO {
//	기존 클래스를 필드로 사용 : mybatis에서는 "resultMap"을 참조해야한다.

//	collection으로 표현
	private OrderDetailVO orderDetailVO;
//  collection으로 표현
	private ProductVO productVO;
}
