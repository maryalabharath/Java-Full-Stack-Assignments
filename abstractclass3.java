package package2;

abstract class jobs{
	abstract void roles();
	
}

class police extends jobs{
	void roles() {
	System.out.println("Police looks after poeples security");
	}
}

class doctor extends jobs{
	 void roles() {
	System.out.println("Doctor takes care of peoples health");
	}
}

public class abstractclass3 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		jobs j;
		
		j=new police();
		j.roles();
		
		j=new doctor();
		j.roles();
	}

}
