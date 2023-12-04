package com.docmall.demo.kakaopay;

import lombok.Data;

// 요청주소 : https://kapi.kakao.com/v1/payment/ready
//결제준비요청(1차) 의 응답결과를 저장하기위한 클래스.

@Data
public class ReadyResponse {

	private String tid; // 결제 고유 번호, 20자
	
	// 요청한 클라이언트가 PC 웹일 경우 카카오톡으로 결제 요청 메시지(TMS)를 보내기 위한 사용자 정보 입력 화면 Redirect URL
	private String next_redirect_pc_url; 
	
	// 추가
	private String partner_order_id; // 가맹점(쇼핑몰)의 주문번호
	
}
