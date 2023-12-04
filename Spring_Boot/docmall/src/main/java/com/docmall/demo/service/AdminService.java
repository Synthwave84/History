package com.docmall.demo.service;

import com.docmall.demo.domain.AdminVO;

public interface AdminService {

	AdminVO admin_ok(String admin_id);
	
	void login_date(String admin_id);
}
