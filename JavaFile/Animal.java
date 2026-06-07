import java.util.*;
class Animal {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("enter the size of the strinjg array");
        int n = sc.nextInt();
         sc.nextLine();   

        String animal[]= new String[n];
  
        for(int i=0;i<n;i++){
          
          System.out.println("enter the animal "+(i+1)+" name:");
          animal[i]=sc.nextLine();
            
        }
         System.out.println("string elements are:");
        for(int i=0;i<n;i++){
           
                System.out.println(animal[i]);
        }
      
        
    }
}

