package javapractice;
import java.util.Scanner;
public class evenOrOdd {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		System.out.println("enter the number: ");
		int num = sc.nextInt();
		
		System.out.println((num%2==0 ? "Even" : "Odd"));
		
	}

}
