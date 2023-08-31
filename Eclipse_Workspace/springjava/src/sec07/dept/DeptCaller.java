package sec07.dept;

public class DeptCaller {
	public static void main(String[] args) {
		
		Dept test1 = new Dept(10,"ACCOUNTING", "New York");
		Dept test2 = new Dept(20,"RESEARCH", "DALLAS");
		Dept test3 = new Dept(30,"SALES", "New CHICAGO");
		Dept test4 = new Dept(40,"OPERATION", "BOSTON");
		System.out.println("----------------------------------");
		System.out.println("|" + test1.DEPTNO+ " | " + test1.DNAME+" | " + test1.LOC + " | ");
		System.out.println("----------------------------------");
		System.out.println("|" + test2.DEPTNO+ " | " + test2.DNAME+" | " + test2.LOC + " | ");
		System.out.println("----------------------------------");
		System.out.println("|" + test3.DEPTNO+ " | " + test3.DNAME+" | " + test3.LOC + " | ");
		System.out.println("----------------------------------");
		System.out.println("|" + test4.DEPTNO+ " | " + test4.DNAME+" | " + test4.LOC + " | ");
		System.out.println("----------------------------------");
	}
}
