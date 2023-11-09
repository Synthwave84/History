package com.demo.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SampleDTO {
	private String name;
	private int age;
	
//	Lombok 에서 처리하였다.
/*	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	@Override
	public String toString() {
		return "SampleDTO [name=" + name + ", age=" + age + "]";
	}
*/	
	
	
	
	
	
}
