package javapractice;
import java.util.Scanner;

public class LargestOfThree {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System .in);
		System.out.println("enter number: ");
		int num1 = sc.nextInt();
		
		
		System.out.println("enter number: ");
		int num2 = sc.nextInt();
		
		
		System.out.println("enter number: ");
		int num3 = sc.nextInt();
				
		System.out.println((num1 > num2) && (num1 > num3) ? "num1 is grater" : (num2 > num1) && (num2 > num3) ? "num2 is grater" : "num3 is grater");
		
	}

}
