package com.docmall.demo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.docmall.demo.domain.CategoryVO;
import com.docmall.demo.mapper.UserCategoryMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service // bean이 생성및등록될 설정작업 :  userCategoryServiceImpl bean 생성. root-context.xml에서 <context:component-scan base-package="com.docmall.service" />
public class UserCategoryServiceImpl implements UserCategoryService {
	
	private final UserCategoryMapper userCategoryMapper; // 주입을 정상적으로 받는다는 전제조건
	
	@Override
	public List<CategoryVO> getSecondCategoryList(Integer cg_prtcode) {
		// TODO Auto-generated method stub
		return userCategoryMapper.getSecondCategoryList(cg_prtcode);
	}

}
