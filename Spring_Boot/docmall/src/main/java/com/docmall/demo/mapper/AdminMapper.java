package com.docmall.demo.mapper;

import com.docmall.demo.domain.AdminVO;

public interface AdminMapper {
	
	AdminVO admin_ok(String admin_id);
	
	void login_date(String admin_id);
}
