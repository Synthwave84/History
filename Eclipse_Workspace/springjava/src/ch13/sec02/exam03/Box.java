package ch13.sec02.exam03;

public class Box<T> {
//	타입 파라미터 지정안하면 Object
	public T content;
//	타입 파라미터 지정 안하면, compare(Box other)
	public boolean compare(Box<T> other) {
		boolean result = content.equals(other.content);
		return result;
	}
}
