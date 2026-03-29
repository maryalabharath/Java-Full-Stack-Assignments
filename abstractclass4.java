package package2;

abstract class trees{
	abstract void functions();
}

class wood extends trees{
	void functions() {
	System.out.println("Trees wood is used as furniture");
	}
}

class leaves extends trees{
	void functions() {
		System.out.println("Leaves are used in medicines");
	}
}

class roots extends trees{
	void functions() {
		System.out.println("Roots are mostly used in ayurveda");
	}
}
	
public class abstractclass4 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		trees t;
		
		t=new leaves();
		t.functions();
		
		t=new wood();
		t.functions();
		
		t=new roots();
		t.functions();
		
		
	}

}
