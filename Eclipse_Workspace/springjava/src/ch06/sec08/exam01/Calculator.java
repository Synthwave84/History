package ch06.sec08.exam01;

public class Calculator {
//	리턴값이 없는 메소드 : void
	void powerOn() {
//		powerOn() 메소드를 호출(실행) 하고, 호출한 쪽으로 제어가 넘어간다.
		System.out.println("전원을 켭니다");
		}
//	리턴값이 없는 메소드
	void powerOff() {
		System.out.println("전원을 끕니다");
	}
	
//	두 정수를 입력받아 더하는 기능
	int plus(int x, int y) {
//		plus() 메소드를 호출한 코드의 값을 출력해 주는 기능
		int result = x+y;

//		plus()메소드를 호출한 코드로 값을 갖고 제어가 넘어간다.
		return result; 
	}
// 두 정수를 입력받아 빼는 기능
	int minus(int x , int y) {
		int result = x - y;
		return result;
	}
	int multiply(int x, int y) {
		int result = x * y;
		return result;
	}
//	두 정수를 입력받아 나누는 기능
	double divide(double x, int y) {
//		후단 데이터의 데이터타입 일치를 위해 전방 계산자에 double 을 추가하여 후면 연산자도 데이터일치화시킨다.
	double result =(double) x / y;
	return result;
	}
	
	
	
	
	
	
	
	
	
	
	
}
