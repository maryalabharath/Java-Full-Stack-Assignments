package interfaces;

interface geometry {
	void shapes();
}

class circle implements geometry{
	public void shapes() {
		System.out.println("Circle have radius");
	}
}

class square implements geometry{
	public void shapes() {
		System.out.println("Square have sides");
	}
}

class rectangle implements geometry{
	public void shapes() {
		System.out.println("Rectangle have LENGTH and BREADTH");
	}
}

class Testgeometry{
	
	public static void main(String[] args) {
		geometry g;
		
		g=new circle();
		g.shapes();
		
		g=new square();
		g.shapes();
		
		g=new rectangle();
		g.shapes();
		
		
	}
}