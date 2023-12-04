package com.docmall.demo.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.docmall.demo.interceptor.UserInterceptor;

@Component
public class WebMvcConfiguration2 implements WebMvcConfigurer {

//	주입기능
	@Autowired
	UserInterceptor userInterceptor;
	
	
//	설정에서 제외되는 경로들
	private static final String[]  EXCLUDE_PATHS = {
		"/admin/intro",
		"/admin/admin_ok"
			
	};
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
		registry.addInterceptor(userInterceptor)
				.addPathPatterns("/admin/**")
				.excludePathPatterns(EXCLUDE_PATHS);
			
	}
	
}
