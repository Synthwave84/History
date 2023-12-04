package com.docmall.demo.service;

import com.docmall.demo.domain.MemberVO;

public interface MemberService {
	
	String idCheck(String mbsp_id);
	
	void join(MemberVO vo);
	
	MemberVO login(String mbsp_id);
	
	void modify(MemberVO vo);
	
	void loginTimeUpdate(String mbsp_id);
	
	void delete(String mbsp_id);
}
