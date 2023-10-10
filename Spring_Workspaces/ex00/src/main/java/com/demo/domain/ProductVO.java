package com.demo.domain;

//	DB의 테이블구조를 참조하여, 생성하는 클래스
// 	Getter/Setter 메소드는 반드시 정의해야한다. 
public class ProductVO {
//	상품명
	private String name;
	
//	상품가격
	private double price;


public ProductVO(String name, double price) {
	super();
	this.name = name;
	this.price = price;
}

public String getName() {
	return name;
}

public void setName(String name) {
	this.name = name;
}

public double getPrice() {
	return price;
}

public void setPrice(double price) {
	this.price = price;
}

	
	
}
