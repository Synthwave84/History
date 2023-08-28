package ch04;

public class GuGuDan {
	public static void main(String[] args) {
//		int gop= 2;
//		if (gop <10) {
//			gop++;
//			
//			System.out.println(gop);
//		}
		
		for ( int gop=1; gop<10; gop++ ) {
			System.out.println();
			for ( int dan=0; dan<10; dan++ ) {
				if (dan==0) {
					System.out.printf("[%d단]" , gop);
				}else {
					System.out.printf( " %dx%d = %d |", gop, dan, gop* dan );
				}
			}
			
		}
		System.out.println();
	} 
		
}

