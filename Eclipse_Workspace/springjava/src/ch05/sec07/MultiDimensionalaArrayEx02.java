package ch05.sec07;

public class MultiDimensionalaArrayEx02 {
	public static void main(String[] args) {
		
//		int[][] mathScores= new int[행의 수][열의 크기];
//		2*3 (2행 3열의 2차원 배열구조)
		
//		int형 배열은 초기값이 0으로 만들어진다.
		int[][] mathScores= new int[2][3];
		for(int i=0; i<mathScores.length; i++) {
			for (int k=0; k<mathScores[i].length; k++) {
				System.out.println("mathScores [" +i+"]["+k+"] " + mathScores[i][k] );
			}
		}
		System.out.println();
		
//		배열 항목의 값 변경
//		첫번째 행
		mathScores [0][0] =80;
		mathScores [0][1] =83;
		mathScores [0][2] =85;
		
//		두번째 행
		mathScores [1][0] =86;
		mathScores [1][1] =90;
		mathScores [1][2] =92;
		
		int totalStudent =0;
		int totalMathSum=0;
		
		for (int i=0; i<mathScores.length; i++) {
			totalStudent+= mathScores[i].length;
			for (int k=0; k<mathScores[i].length; k++) {
				totalMathSum += mathScores[i][k];
			}
		}
		double totalMathAvg = (double) totalMathSum / totalStudent;
		System.out.println(totalMathAvg);
		System.out.println();
		
		
//		가변배열(Jagged Array) : 행마다 열의 크기가 다르게 사용되는 특징. 톱모양
//		열의 크기를 생략 = 가변배열.
		int [][] englishScores = new int[2][];
//		첫번째 행은 열의 크기를 2로 설정
		englishScores[0] = new int[2];
//		두번째 행은 열의 크기를 3으로 설정
		englishScores[1] = new int[3]; 
		
		for(int j=0; j<englishScores.length; j++) {
			for (int l=0; l<englishScores[j].length; l++) {
				System.out.println("englishScores [" +j+"]["+l+"] " + englishScores[j][l] );
			}
		}
		
		englishScores [0][0] = 90;
		englishScores [0][1] = 91;
//		두번째 행
		englishScores [1][0] = 92;
		englishScores [1][1] = 93;
		englishScores [1][2] = 94;
		
		System.out.println();
		
		int totalEngStudent = 0;
		int totalEngSum= 0;
		for (int x=0; x<englishScores.length; x++) {
			totalEngStudent+= englishScores[x].length;
			for (int y=0; y<englishScores[x].length; y++) {
				totalEngSum+= englishScores[x][y];
				System.out.println("englishScores [" +x+"]["+y+"] " + englishScores[x][y] );
			}
		}
			double totalEngAvg = (double) totalEngSum / totalEngStudent;
			System.out.println(totalEngAvg);
	
		}
	
	}
	

