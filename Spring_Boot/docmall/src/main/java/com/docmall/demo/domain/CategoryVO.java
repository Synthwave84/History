package com.docmall.demo.domain;

// cg_code, cg_parent_code, cg_name
public class CategoryVO {

	private Integer cg_code; // 1, 2차 모든카테고리코드
	private Integer cg_prtcode; // 1차카테고리코드
	private String cg_name;
	
	// @Getter, @Setter
	public Integer getCg_code() {
		return cg_code;
	}
	public void setCg_code(Integer cg_code) {
		this.cg_code = cg_code;
	}
	public Integer getCg_prtcode() {
		return cg_prtcode;
	}
	public void setCg_prtcode(Integer cg_prtcode) {
		this.cg_prtcode = cg_prtcode;
	}
	public String getCg_name() {
		return cg_name;
	}
	public void setCg_name(String cg_name) {
		this.cg_name = cg_name;
	}
	
	// @ToString
	@Override
	public String toString() {
		return "CategoryVO [cg_code=" + cg_code + ", cg_prtcode=" + cg_prtcode + ", cg_name=" + cg_name + "]";
	}
	
	
}
