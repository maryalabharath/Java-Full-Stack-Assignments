public class practice {
	public static void main(String []args) {
	
	//int length=12;
	//int breadth=24;
	//int height=10;

	//int area = length*breadth;
	//int volume = length*breadth*height;
	//System.out.println("Area is: " +area);
	//System.out.println("Volume is : " +volume);

	int t = 23;
	
	if (t < 20){
	System.out.println("Good morning");
	}else{
	System.out.println("Good evening");}


	var x = "This is var keyword";
	var y = 35;
	System.out.println(y);
	System.out.println(x);

	System.out.println(Math.pow(3,2));

	String[]cars={"maruti","bmw","benz","toyota"};


	for (int i=0 ; i<cars.length ; i++) {
	System.out.println(cars[i]);	
	}


	System.out.println(cars[2]);

	String S1 = "hello";
	byte[] result = S1.getBytes();
	String S2 = "hello";
	String S3 = new String ("hello");
	String S4 = new String ("hello");

	if (S1==S2)
	System.out.println("True, S1 and S2 are equal");
	else
	System.out.println("False");
	
	if (S1==S3)
	System.out.println("True, S1 and S3 are not equal");
	else
	System.out.println("False, S1 and S3 are not equal");

	if (S4==S3)	
	System.out.println("True, S4 and S3 are equal");
	else
	System.out.println("False, S4 and S3 are not equal");


	System.out.println(result[0]);

	
	


	
	}
}