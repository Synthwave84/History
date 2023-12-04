package com.docmall.demo.mapper;

import java.util.List;

import com.docmall.demo.domain.CategoryVO;
/*
	Mapper 인터페이스 대신 하단의 형태를 가짐
	Interface AdCategoryDAO
	@Repository
	class AdCategoryDAOImpl
*/
public interface AdCategoryMapper {

	List<CategoryVO> getFirstCategoryList();
	
	List<CategoryVO> getSecondCategoryList(Integer cg_prtcode);
	
	CategoryVO get(Integer cg_code);
}
