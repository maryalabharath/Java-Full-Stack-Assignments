class CountWords {
	public static void main(String args[]) {
		String s = "shiva kumar";
		int count = 0;
		char ch;

		for(int i=0; i<=s.length()-1; i++) {
			ch = s.charAt(i);
				count++;
		}
		System.out.println(count);
	}
}