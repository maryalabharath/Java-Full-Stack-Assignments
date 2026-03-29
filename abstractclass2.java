package package2;

abstract class sound {
	abstract void sounds();
	
	void info(){
		System.out.println("animals makes sounds");
	}
}	

class dog extends sound {
	void sounds() {
		System.out.println("Dog makes BOW-BOW");
		}
}

abstract class cat extends sound {
	void sounds() {
		System.out.println("Cate makes MEOW-MEOW");
	}
}

 class kitten extends cat{
	
}
 
 


public class abstractclass2 {
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		sound s;

		
		s= new dog();
		s.info();
		s.sounds();
		
	    s= new kitten();
	    s.sounds();
		
		
	}

}
