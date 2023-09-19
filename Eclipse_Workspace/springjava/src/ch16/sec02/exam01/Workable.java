package ch16.sec02.exam01;

//	함수형인터페이스 : 추상형 메소드1개, 람다식으로 재정의 하여 사용가능
@FunctionalInterface
public interface Workable {
//	매개변수가 없음.-> 매개변수가 없는 람다식 문법 사용.
	void work();
}
