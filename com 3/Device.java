package hybrid.com;

public class Device {
	String brand;
	double price;
	
	Device(String brand, double price){
		this.brand = brand;
		this.price = price;
	}
	
	void display() {
		System.out.println("Device Brand is: "+brand);
		System.out.println("the Decice price is: "+price);
	}
}
