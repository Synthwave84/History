package com.docmall.demo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.docmall.demo.domain.CategoryVO;
import com.docmall.demo.mapper.AdCategoryMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Slf4j
@Service
public class AdCategoryServiceImpl implements AdCategoryService {

	private final AdCategoryMapper adCategoryMapper;

	@Override
	public List<CategoryVO> getFirstCategoryList() {
		// TODO Auto-generated method stub
		return adCategoryMapper.getFirstCategoryList();
	}

	@Override
	public List<CategoryVO> getSecondCategoryList(Integer cg_prtcode) {
		// TODO Auto-generated method stub
		return adCategoryMapper.getSecondCategoryList(cg_prtcode);
	}

	@Override
	public CategoryVO get(Integer cg_code) {
		// TODO Auto-generated method stub
		return adCategoryMapper.get(cg_code);
	}
}
