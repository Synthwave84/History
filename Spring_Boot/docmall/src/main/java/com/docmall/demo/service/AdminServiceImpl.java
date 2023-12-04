package com.docmall.demo.service;

import org.springframework.stereotype.Service;

import com.docmall.demo.domain.AdminVO;
import com.docmall.demo.mapper.AdminMapper;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service // bean 생성및등록 : adminServiceImpl
public class AdminServiceImpl implements AdminService {

	private final AdminMapper adminMapper;

	/*
	public AdminServiceImpl(AdminMapper adminMapper) {
		this.adminMapper = adminMapper;
	}
	*/
	
	@Override
	public AdminVO admin_ok(String admin_id) {
		// TODO Auto-generated method stub
		return adminMapper.admin_ok(admin_id);
	}

	@Override
	public void login_date(String admin_id) {
		// TODO Auto-generated method stub
		adminMapper.login_date(admin_id);
	}
	
	
}
