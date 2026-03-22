class StringDemo {
   public static void main(String args[]) {
		// object creation
	String s1 = new String("Hello");
	String s2 = new String("Hello");


// it compares the memory location and gives the output in the form of boolean
		System.out.println(s1==s2);

//it compares the text present in the object or variable and give the boolean value
		System.out.println(s1.equals(s2));
	}
}