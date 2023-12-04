package com.docmall.demo.service;

import java.util.List;

import com.docmall.demo.domain.ProductVO;
import com.docmall.demo.dto.Criteria;

public interface UserProductService {

	// 2차카테고리별 상품리스트(페이징정보사용, 검색제외)
	List<ProductVO> pro_list(Integer cg_code, Criteria cri);
	
	int getTotalCount(Integer cg_code);
	
	ProductVO pro_detail(Integer pro_num);
}
