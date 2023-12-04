package com.docmall.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.docmall.demo.domain.CartVO;
import com.docmall.demo.dto.CartDTOList;



// DAO 의미와 동일.
public interface CartMapper {

	
	void cart_add(CartVO vo);
	
	List<CartDTOList> cart_list(String mbsp_id);
	
	void cart_amount_change(@Param("cart_code") Long cart_code, @Param("cart_amount") int cart_amount);
	
	void cart_list_del(Long cart_code);
	
	//장바구니 선택삭제. 파라미터 List컬렉션 사용.
	void cart_sel_delete(List<Long> cart_code_arr);
}
