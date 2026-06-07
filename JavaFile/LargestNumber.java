import java.util.*;

public class LargestNumber {
	public static void main(String args[]) {
	Scanner sc = new Scanner(System.in);
	
	System.out.println("enter any three number :");
	int a = sc.nextInt();
	int b = sc.nextInt();
	int c = sc.nextInt();

	if(a>=b && a>=c) {
		System.out.println("largest is : " + a);
	}
	else if(b>=a && b>=c) {
		System.out.println("largest is : " + b);
	}
	else {
		System.out.println("largets is : " + c);
	}
}
}