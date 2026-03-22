class palindrome {
	public static void main(String args[]) {
		String s = "racecar";
		String rev = "";

		for(int i=s.length()-1; i>=0; i--) {

			rev = rev+s.charAt(i);
		}

		if(s.equals(rev)) {
			System.out.println("palindrome number");
		} else {
			System.out.println("not a palindrome");
		}
	}
}
