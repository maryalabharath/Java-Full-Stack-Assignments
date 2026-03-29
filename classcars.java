package package2;

import javafullstack.furniture;

public class cars2 {
	String Brand;
	String model;
	int price;
	
	
	cars2(String Brand,String model,int price){
		this.Brand= Brand;
		this.model= model;
		this.price= price;
		
	}
	
	void display() {
		System.out.println("Brand of the car: " + Brand);
		System.out.println("Model of the car: " + model);
		System.out.println("Price of the car: " + price);
		System.out.println("--------------------------");
	}
	

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		cars2 c1 = new cars2("Audi","Q5",7000000);
		cars2 c2 = new cars2("Toyota","Fortuner",4500000);
		 
		
		
		c1.display();
		c2.display();
		
		
		javafullstack.furniture f1 = new furniture("Sofa","Cedar","Ivory",35000);                   
		f1.display();
	
		
	}

}
