package ch16.sec01;

//	함수형 인터페이스 : 인터페이스가 단 하나의 추상 메소드를 가지고 있는 것
//	인터페이스에 익명 구현객체를 람다식으로 표현하려면, 함수형 인터페이스이어야 한다.
//	컴파일 과정에서 추상메소드가 하나인지 검사를 한다. 명시적으로 사용하며
//	컴파일러에게 함수형 인터페이스라고 정보를 알린다. 
@FunctionalInterface  
public interface Calculable {

//		추상 메소드
		void calculate(int x, int y);
}
