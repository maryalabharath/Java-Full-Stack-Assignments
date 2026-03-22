package javapractice;
import java.util.Scanner;
public class palimdromeNumber {
	public static void main(String args[]) {
		Scanner sc = new Scanner(System.in);
		System.out.print("enter the number: ");
		int num = sc.nextInt();
		int rev=0;
		int temp = num;
		while(num > 0) {
			rev = rev * 10 + num % 10;
			num /=10;
		}
		System.out.println(rev);
		System.out.println((temp == rev) ? "palindrame number" : "not a palindrome number");
	}
	

}
