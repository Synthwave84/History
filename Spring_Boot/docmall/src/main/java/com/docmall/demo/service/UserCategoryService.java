package com.docmall.demo.service;

import java.util.List;

import com.docmall.demo.domain.CategoryVO;

public interface UserCategoryService {

	List<CategoryVO> getSecondCategoryList(Integer cg_prtcode);
}
