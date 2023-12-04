package com.docmall.demo.domain;

import lombok.Data;

//	관리자 페이지에서 주문 상세정보를 저장 및 조회하기 위한 목적 (주문상세테이블 + 상품 테이블 join) 
@Data
public class OrderDetailInfoVO {
	private Long 		ord_code;
	private Integer		pro_num;
	private String		pro_name;
	private int			pro_price;
	private int	    	dt_amount;
//	주문금액(pro_price * dt_amount)
	private int			ord_price;
	
	private String		pro_up_folder;
	private	String		pro_img;
}
