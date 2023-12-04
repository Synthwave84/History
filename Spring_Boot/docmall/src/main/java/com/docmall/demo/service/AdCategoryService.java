package com.docmall.demo.service;

import java.util.List;

import com.docmall.demo.domain.CategoryVO;

public interface AdCategoryService {

	List<CategoryVO> getFirstCategoryList();
	
	List<CategoryVO> getSecondCategoryList(Integer cg_prtcode);
	
	CategoryVO get(Integer cg_code);
}
