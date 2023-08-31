package ch05.sec06.copy;

public class Arraycall {

	public static void main(String[] args) {
		 int[] arr1 = ArrayClass.createIntArray();
	        printArray(arr1);

	        System.out.println("--------------------------------------------");

	        double[] arr2 = ArrayClass.createDoubleArray();
	        printArray(arr2);

	        System.out.println("---------------------------------------------");

	        String[] arr3 = ArrayClass.createStringArray();
	        printArray(arr3);
	    }

	    public static void printArray(int[] arr) {
	        for (int i = 0; i < arr.length; i++) {
	            System.out.println("arr[" + i + "] : " + arr[i] + ", ");
	        }
	    }

	    public static void printArray(double[] arr) {
	        for (int i = 0; i < arr.length; i++) {
	            System.out.println("arr[" + i + "] : " + arr[i] + ", ");
	        }
	    }

	    public static void printArray(String[] arr) {
	        for (int i = 0; i < arr.length; i++) {
	            System.out.println("arr[" + i + "] : " + arr[i] + ", ");
	        }

	}

}
