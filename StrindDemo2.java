//compareTo
class StrindDemo2 {
	public static void main(String args[]) {
         //object creation
		String s1 = new String("Hello World");
		String s2 = new String("Hello world");

        //printing statements

        System.out.println(s1.compareTo(s2));
	}
}

//it compares the every element by using the ASCII values in the string and gives values in the form of 
//1.positive (str1 grater than str2)
//2.negative (str2 grater than str1)
//3.nero (equal string)
