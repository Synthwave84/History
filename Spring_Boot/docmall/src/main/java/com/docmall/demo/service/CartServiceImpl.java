package com.docmall.demo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.docmall.demo.domain.CartVO;
import com.docmall.demo.dto.CartDTOList;
import com.docmall.demo.mapper.CartMapper;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class CartServiceImpl implements CartService {
	
	private final CartMapper cartMapper;

	@Override
	public void cart_add(CartVO vo) {
		// TODO Auto-generated method stub
		cartMapper.cart_add(vo);
	}

	@Override
	public List<CartDTOList> cart_list(String mbsp_id) {
		// TODO Auto-generated method stub
		return cartMapper.cart_list(mbsp_id);
	}

	@Override
	public void cart_amount_change(Long cart_code, int cart_amount) {
		// TODO Auto-generated method stub
		cartMapper.cart_amount_change(cart_code, cart_amount);
	}

	@Override
	public void cart_list_del(Long cart_code) {
		// TODO Auto-generated method stub
		cartMapper.cart_list_del(cart_code);
	}

	@Override
	public void cart_sel_delete(List<Long> cart_code_arr) {
		// TODO Auto-generated method stub
		cartMapper.cart_sel_delete(cart_code_arr);
	}
}
