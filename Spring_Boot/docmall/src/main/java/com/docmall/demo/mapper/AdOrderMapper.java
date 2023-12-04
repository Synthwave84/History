package com.docmall.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.docmall.demo.domain.OrderDetailInfoVO;
import com.docmall.demo.domain.OrderDetailProductVO;
import com.docmall.demo.domain.OrderVO;
import com.docmall.demo.dto.Criteria;

public interface AdOrderMapper {

	
	List<OrderVO> order_list(
			@Param("cri")Criteria cri, 
			@Param("start_date")String start_date, 
			@Param("end_date")String end_date);
	
	int getTotalCount(
			@Param("cri")Criteria cri,
			@Param("start_date")String start_date, 
			@Param("end_date")String end_date);
	

	List<OrderDetailInfoVO> orderDetailInfo1(Long ord_code); 
//	기존 클래스 OrderDetailVO, ProductVO 필드가 있는 클래스
	List<OrderDetailProductVO> orderDetailInfo2(Long ord_code); 
	
	void order_product_delete
	(@Param("ord_code") Long ord_code, 
	@Param("pro_num") Integer pro_num);
	
}
