package com.docmall.demo.mapper;

import java.util.List;

import com.docmall.demo.domain.CategoryVO;

public interface UserCategoryMapper {

	List<CategoryVO> getSecondCategoryList(Integer cg_prtcode);
}
