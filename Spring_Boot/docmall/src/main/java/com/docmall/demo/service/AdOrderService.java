package com.docmall.demo.service;

import java.util.List;

import com.docmall.demo.domain.OrderDetailInfoVO;
import com.docmall.demo.domain.OrderDetailProductVO;
import com.docmall.demo.domain.OrderVO;
import com.docmall.demo.dto.Criteria;

public interface AdOrderService {

	List<OrderVO> order_list(Criteria cri, String start_date, String end_date);
	
	int getTotalCount(Criteria cri, String start_date, String end_date);
	
	List<OrderDetailInfoVO> orderDetailInfo1(Long ord_code); 
	
//	resultMap
	List<OrderDetailProductVO> orderDetailInfo2(Long ord_code);
	
	void order_product_delete(Long ord_code, Integer pro_num);
	
	
								
	
}
