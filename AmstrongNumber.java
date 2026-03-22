package javapractice;

public class AmstrongNumber {

	public static void main(String[] args) {
		int n=15;
		int temp = n;
		int sum = 0;
		
		while(n > 0) {
			int d = n % 10;
			sum = sum + d*d*d;
			n = n/10;
		}
		System.out.println((sum == temp)? "true" : "false");
	}

}
