package javapractice;

public class PrimeBetweenRange {

	public static void main(String[] args) {
		for(int n=10;n<=30;n++){
		    int count=0;
		    for(int i=1;i<=n;i++)
		        if(n%i==0) count++;

		    if(count==2)
		        System.out.print(n+" ");
		}

	}

}
