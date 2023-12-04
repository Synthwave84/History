package com.docmall.demo.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.docmall.demo.domain.OrderVO;
import com.docmall.demo.domain.PaymentVO;
import com.docmall.demo.mapper.OrderMapper;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class OrderServiceImpl implements OrderService {
	
	private final OrderMapper orderMapper;

	@Override
	public int getOrderSeq() {
		// TODO Auto-generated method stub
		return orderMapper.getOrderSeq();
	}

	@Transactional // 트랜잭션 적용.(중요)
	@Override
	public void order_insert(OrderVO o_vo, PaymentVO p_vo) {
		
		orderMapper.order_insert(o_vo);
		orderMapper.order_detail_insert(o_vo.getOrd_code(), o_vo.getMbsp_id());
		orderMapper.cart_del(o_vo.getMbsp_id());
		orderMapper.payment_insert(p_vo);
	}
}
