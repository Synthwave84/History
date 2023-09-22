package ch18.sec04.exam02;

public class ars {
	public static void main(String[] args) {
		int arr[] = new int[] {10,6,25,7,4};
		for(int i=0; i<arr.length-1; ++i) {
			for(int j=0; j<arr.length; ++j) {
				if(arr[i] < arr[j]) {
					System.out.println(arr[j]);
				}
			}
		}
		
		
		
		
		}
	}

