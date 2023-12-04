package com.docmall.demo.service;

import java.util.List;

import com.docmall.demo.domain.ReviewVO;
import com.docmall.demo.dto.Criteria;

public interface ReviewService {

	void review_insert(ReviewVO vo);
	
	List<ReviewVO> list(Integer pro_num, Criteria cri); //검색필드 사용안함
	
	int listCount(Integer pro_num);
	
	void delete(Long rew_num);
}
