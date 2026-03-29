package hybrid2.com;

public class Manager {
	String name;
	int age;
	
	//constructor
	Manager(String name, int age){
		this.name = name;
		this.age = age;
	}
	
	//display function
	void display() {
		System.out.println("Name of the manager: "+name);
		System.out.println("Age of the Manager: "+age);
	}
}
