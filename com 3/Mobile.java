package hybrid.com;

class Mobile extends Device {
	int camersMegaPixcel;
	
	Mobile(String brand, double price, int camersMegaPixcel){
		super(brand, price);
		this.camersMegaPixcel = camersMegaPixcel;
	}
	
	void display() {
		super.display();
		System.out.println("the system camera is: "+camersMegaPixcel);
	}
}
