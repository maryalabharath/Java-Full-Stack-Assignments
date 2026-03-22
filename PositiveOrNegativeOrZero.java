package javapractice;
import java.util.Scanner;
public class PositiveOrNegativeOrZero {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("Enter trhe number: ");
		int num = sc.nextInt();
		
		System.out.println((num > 0) ? "Positive" : (num < 0) ? "Negative" : "Zero");

	}

}
