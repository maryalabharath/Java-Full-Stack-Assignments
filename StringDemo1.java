class StringDemo1 {
	public static void main(String args[]) {

//object creation
		String s1 = new String("Hero world");
		

//in split method it uses the string array to split the array


//declearing String array  //spliting the data
		String[] words = s1.split(" ");

	// for each loop for printing the data
		for(String word : words) {
			System.out.println(word);
		}
	}
}