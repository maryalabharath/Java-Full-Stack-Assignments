import java.util.*;
class Sum {
    public static void main(String[] args) {
        int arr[]=new int[5];
        Scanner sc = new Scanner(System.in);
        for(int i=0;i<5;i++){
             System.out.println("enter the array element "+(i+1)+":");
             arr[i]=sc.nextInt();
        }
        int min=arr[0];
        for(int i=0;i<5;i++){
            if(arr[i]<min){
                min=arr[i];
            }
        }
        System.out.println("minimum value is :"+min);
        
    }
}
