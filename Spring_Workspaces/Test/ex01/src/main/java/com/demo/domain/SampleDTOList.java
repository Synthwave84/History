package com.demo.domain;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

//  클라이언트에서 SampleDTO 클래스의 필드에 해당하는 파라미터가 여러개 전달받을 때 사용


//  @Data필요한 내용을 한꺼번에 만들어준다. SampleDTOList 클래스 하위 목록 확인	
@Data
public class SampleDTOList {
//	컬렉션 = java.util인터페이스
	private List<SampleDTO> list;
		
	public SampleDTOList() {
		list = new ArrayList<SampleDTO>();
	}
}
