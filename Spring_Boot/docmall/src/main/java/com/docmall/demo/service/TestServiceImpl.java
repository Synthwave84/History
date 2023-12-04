package com.docmall.demo.service;

import org.springframework.stereotype.Service;

import com.docmall.demo.mapper.TimeMapper;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class TestServiceImpl implements TestService {

	private final TimeMapper timeMapper;

	@Override
	public String getTime() {
		// TODO Auto-generated method stub
		return timeMapper.getTime();
	}
}
