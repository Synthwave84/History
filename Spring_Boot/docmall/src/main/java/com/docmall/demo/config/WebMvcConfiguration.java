package com.docmall.demo.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.docmall.demo.interceptor.UserInterceptor;

@Component
public class WebMvcConfiguration implements WebMvcConfigurer {

//	주입기능
	@Autowired
	UserInterceptor userInterceptor;
	
	
//	설정에서 제외되는 경로들
	private static final String[]  EXCLUDE_PATHS = {
		
	};
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
		registry.addInterceptor(userInterceptor)
				.addPathPatterns("/member/confirmPw","/member/modify","member/mypage","member/delConfirmPw")
				.addPathPatterns("/user/cart/*")
				.addPathPatterns("/user/order/*");
	}
	
}
