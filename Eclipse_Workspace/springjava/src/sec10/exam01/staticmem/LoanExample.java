package sec10.exam01.staticmem;

public class LoanExample {
	public static void main(String[] args) {
//		홍길동 대출
		Loan.iYul = 3;
		Loan loan1 = new Loan("홍길동", 5000);

//		손흥민 대출
		Loan loan2 = new Loan("손흥민", 3000);
		
//		이강인 대출
		Loan loan3 = new Loan("이강인", 8000);
		
		System.out.printf("%s 대출정보는? %d원이고, %d 이율 입니다 \n", loan1.name,loan1.price,Loan.iYul);
		System.out.printf("%s 대출정보는? %d원이고, %d 이율 입니다 \n", loan2.name,loan2.price,Loan.iYul);
		System.out.printf("%s 대출정보는? %d원이고, %d 이율 입니다 \n", loan3.name,loan3.price,Loan.iYul);
		System.out.println("--------이율이 3->5로 변화 ------------");
//		홍길동 대출
		
		Loan.iYul=5;
		
//		고정금리 이지만, 코로나로 인하여, 금융정책이 변화 되었다. 3% -> 5%
		System.out.printf("%s 대출정보는? %d원이고, %d  이율입니다 \n", loan1.name,loan1.price,Loan.iYul);
		System.out.printf("%s 대출정보는? %d원이고, %d  이율입니다 \n", loan2.name,loan2.price,Loan.iYul);
		System.out.printf("%s 대출정보는? %d원이고, %d  이율입니다 \n", loan3.name,loan3.price,Loan.iYul);
		
	}
}
