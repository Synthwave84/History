package com.docmall.demo.service;

import com.docmall.demo.domain.OrderVO;
import com.docmall.demo.domain.PaymentVO;

public interface OrderService {

	int getOrderSeq();
	
	// 주문하기
	void order_insert(OrderVO o_vo, PaymentVO p_vo);
}
