package com.docmall.demo.service;

import org.springframework.stereotype.Service;

import com.docmall.demo.domain.MemberVO;
import com.docmall.demo.mapper.MemberMapper;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class MemberServiceImpl implements MemberService {
	//자동주입
	// @RequiredArgsConstructor : memberMapper필드를 매개변수로 하는 생성자메서드가 생성
	private final MemberMapper memberMapper;
	/*
	private MemberServiceImpl(MemberMapper memberMapper) {
		this.memberMapper = memberMapper;
	}
	*/

	@Override
	public String idCheck(String mbsp_id) {
		// TODO Auto-generated method stub
		return memberMapper.idCheck(mbsp_id);
	}

	@Override
	public void join(MemberVO vo) {
		// TODO Auto-generated method stub
		memberMapper.join(vo);
	}

	@Override
	public MemberVO login(String mbsp_id) {
		// TODO Auto-generated method stub
		return memberMapper.login(mbsp_id);
	}

	@Override
	public void modify(MemberVO vo) {
		// TODO Auto-generated method stub
		memberMapper.modify(vo);
	}

	@Override
	public void loginTimeUpdate(String mbsp_id) {
		// TODO Auto-generated method stub
		memberMapper.loginTimeUpdate(mbsp_id);
	}

	@Override
	public void delete(String mbsp_id) {
		// TODO Auto-generated method stub
		memberMapper.delete(mbsp_id);
	}
}
