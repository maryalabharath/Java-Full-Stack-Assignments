public class palindrome{
	public static void main(String []args) {
	String p="racecar";
	String p1="";
	for (int i=p.length()-1;i>=0;i--){
		p1= p1 + p.charAt(i);
	}
	if (p.equals(p1)){
		System.out.println("Palindrome");
	}
	else{
		System.out.println("Not a palindrome");
	}
}
}