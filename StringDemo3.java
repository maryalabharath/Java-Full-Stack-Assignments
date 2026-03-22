class StringDemo3 {
	public static void main(String args[]) {
	
	String s1 = new String("Hello");

	String s2 = new String("hello");

	System.out.println(s1.compareToIgnoreCase(s2));
	}
}

//it compares the every element by using the ASCII values in the string and gives values in the form of 
//1.positive (str1 grater than str2)
//2.negative (str2 grater than str1)
//3.nero (equal string)
// but it ignores the case