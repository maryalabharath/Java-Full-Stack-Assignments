package hybrid2.com;

public class Hotel1 extends Manager {
	String  HotelName;
	String branch;
	int id;
	double Income;
	
	//Constructor
	Hotel1(String HotelName, String branch, int id, double Income, String name, int age) {
		super(name, age);
		this.HotelName = HotelName;
		this.branch = branch;
		this.id = id;
		this.Income = Income;
	}
	
	//display function
	void display() {
	super.display();
	System.out.println("name of the hotel is: "+HotelName);
	System.out.println("branch of the hotel: "+branch);
	System.out.println("id of the hotel: "+id);
	System.out.println("income of the hotel: "+Income);
	}
}
