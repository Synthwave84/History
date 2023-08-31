package ch05.sec06.copy;

public class ArrayClass {
	public static int[] createIntArray() {
        int[] arr = new int[3];
        arr[0] = 10;
        arr[1] = 20;
        arr[2] = 30;
        return arr;
    }

    public static double[] createDoubleArray() {
        double[] arr = new double[3];
        arr[0] = 0.1;
        arr[1] = 0.2;
        arr[2] = 0.3;
        return arr;
    }

    public static String[] createStringArray() {
        String[] arr = new String[3];
        arr[0] = "1월";
        arr[1] = "2월";
        arr[2] = "3월";
        return arr;
    }
}