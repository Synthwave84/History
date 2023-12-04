package com.docmall.demo.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.docmall.demo.domain.AdminVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
// bean으로 생성한다.
@Component
public class AdminInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		boolean result = false;
		
//		현재 클라이언트의 인증 상태 확인을 할 수 있다.
		HttpSession session =  request.getSession();
		AdminVO admin =  (AdminVO) session.getAttribute("adminStatus");
		
//		인증정보가 없을경우
		if(admin == null) {
//			컨트롤러로 진입하지 못한다
			result = false;
			
			if(isAjaxRequest(request)) {
//				상태코드 값을 그대로 보낸다.
//				클라이언트 error이 동작했다.
				response.sendError(400);
			}	else {
					getTargetUrl(request);
					response.sendRedirect("/admin/intro");
				}
//		인증정보가 있을경우
		}	else {
//				컨트롤러로 진입 가능하다
				result = true;
			}
		
		// TODO Auto-generated method stub
		return result; 
	}

//	인증되지 않은 상태에서 사용자가 요청한 URL을 저장하고 로그인 후 URL로 리다이랙트
	private void getTargetUrl(HttpServletRequest request) {
		
		
		String uri = request.getRequestURI();
		String query = request.getQueryString();
		
		if(query == null || query.equals("null")) {
			query = "";
		}	else {
			query = "?" + query;
			} 
		String targetUrl = uri + query;
		if(request.getMethod().equals("GET")) {
			request.getSession().setAttribute("targetUrl", targetUrl);
			
		}
	}
	
//	사용자의 요청이 ajax 요청인지 체크
	private boolean isAjaxRequest(HttpServletRequest request) {
		
		boolean isAjax = false;
		
		String header = request.getHeader("AJAX");
		if(header != null && header.equals("true")) {
			isAjax = true;
		}
		
		return isAjax;
	}
}
