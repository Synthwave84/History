package ch02.sec12;

public class PrintfExample {
public static void main(String[] args) {
	int value = 123;
	System.out.println("상품의가격:"  +  value + "원");
	
//	int => %d 
	System.out.printf("상품의 가격 : %d원\n", value);
//	%6d =>6자리수의 공간을 만든다. value 변수값이 오른쪽 정렬
	System.out.printf("상품의 가격 : %6d원\n", value);
//	%-6d => 6자리수의 공간을 만든다. value 변수값이 왼쪽 정렬
	System.out.printf("상품의 가격 : %-6d원\n", value);
//	$06d => 6자리수 공간을 만들고 value변수값에 0을 붙인다. 왼쪽 3자리는 0이 되는것
	System.out.printf("상품의 가격 : %06d원\n", value);
	
	double area = 3.14159 * 10 * 10;
//	소수일 시 f 그리고 최대자 10,소숫점은 2자리까지 출력.
//	314.16 으로 뒤의 자리는 반올림 처리
	
	System.out.printf( "반지름이 %d인 원의 넓이 : %10.2f\n", 10, area);
	
	String name = "홍길동";
	String job = "도적";
	System.out.printf("%6d | %-10s | %10s\n", 1, name, job);
	
	}
}
