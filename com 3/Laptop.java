package hybrid.com;

public class Laptop extends Device {
	int SSD;
	
	Laptop(String brand, double price, int SSD){
	super(brand, price);
	this.SSD=SSD;
	}
	
	void display() {
		super.display();
		System.out.println("the system SSD: "+SSD);
	}
}
