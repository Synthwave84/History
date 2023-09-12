package ch12.sec03.exam01;

// 클래스가 상속하지 않은 경우에는 Object
// 클래스를 자동으로 상속받는다.
public class Member /*extends Object*/ {
	public String id;
	
	public Member(String id) {
		this.id = id;
	}
	
//	Object 클래스의 equals()메소드는 객체의 주소를 비교하는 목적을 가지고있다.
//	Member 클래스 equals()메소드를 재정의하여, Member클래스의 용도에 맞게
//	재정의 작업을 하자.
	
	@Override
	public boolean equals(Object obj) {
		
		if(obj instanceof Member) {
			Member target = (Member) obj;
			if (id.equals(target.id)) {
				return true;
			}
		}
		return false;
	}
}
