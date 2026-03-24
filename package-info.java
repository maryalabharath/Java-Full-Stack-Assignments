package bankManagementSystem;

class BankAccountSystem {
	private float bankBalance;
	
	String name;
	String accType;
	int age;
	
	void setbankBalance() {
		bankBalance = 100;
	}
	
	
	BankAccountSystem(String name, String accType, int age) {
		this.name = name;
		this.accType = accType;
		this.age = age;	
	}
	
	void deposite(float amount) {
		bankBalance = bankBalance + amount;
		System.out.println("deposited Successfully!");
	}
	
	void withdraw(float amount) {
		if(amount >= bankBalance) {
			bankBalance = bankBalance - amount;
		}else {
			System.out.println("insufficient balance!");
		}
	}
}


class Main{
	public static void main(String args[]) {
		BankAccountSystem b = new BankAccountSystem("shiva", "normal", 21);
		b.deposite(100);
		b.withdraw(100);	
	}
}