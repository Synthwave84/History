package ch13.sec05;

//	Applicant : 응모자 (수강신청자)
public class Applicant <T> {
	public T kind;
	
	public Applicant(T kind) {
		this.kind = kind;
	}
}
