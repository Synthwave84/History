package com.docmall.demo.dto;

import lombok.Data;

@Data
public class CartDTOList {

	// c.cart_code, c.pro_num,c.cart_amount, p.pro_name, p.pro_price, p.pro_img, p.pro_discount, p.pro_up_folder
	
	private Long cart_code;
	private Integer pro_num;
	private int cart_amount;
	
	private	String	pro_name;
	private	int		pro_price;
	private	String	pro_up_folder;  // 스프링에서 별도로 처리
	private	String	pro_img;	// // 스프링에서 별도로 처리
	private	int		pro_discount;
	
	
}
