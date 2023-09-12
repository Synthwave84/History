package ch12.sec03.exam02;

public class Student {

	private int no;
	private String name;
	
	public Student (int no, String name) {
		this.no = no;
		this.name = name;
	}

	public int getNo() {return no;}

	public String getName() {return name;}
	
	// 재정의 하는 목적은 객체와의 동등 비교
		@Override
		public int hashCode() {
			int hashCode = no + name.hashCode();
			System.out.println("hashCode() 호출");
			return hashCode;
		}

		@Override
		public boolean equals(Object obj) {
			System.out.println("equals() 호출");
			if(obj instanceof Student) {
				Student target = (Student) obj;
				if (no == target.getNo() && name.contentEquals(target.getName())) {
					return true;
				}
			}
			return false;
		}	
	

	
	
	
	
	
}
