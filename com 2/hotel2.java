package hybrid2.com;

public class hotel2 extends Manager {
		String Hote2Name;
		int idno;
		double profit;
		
		//Constructor
		hotel2(String Hote2Name,int idno, double profit, String name,int age) {
			super(name, age);
			this.Hote2Name = Hote2Name;
			this.idno = idno;
			this.profit = profit;
		}
		
		//display function
		void display1() {
		super.display();
		System.out.println("name of the hotel is: "+Hote2Name);
		System.out.println("branch of the hotel: "+idno);
		System.out.println("id of the hotel: "+profit);
	 }
}
