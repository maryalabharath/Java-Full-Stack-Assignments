import java.util.*;

class MyClass {
   static void display(Scanner sc){
        System.out.println("enter you name");
        String name = sc.nextLine();
        System.out.println("enter the age");
        int  age = sc.nextInt();
        System.out.println("name:"+name+"\nage:"+age);
    }
    public static void main(String[] args){
      Scanner sc = new Scanner(System.in);
      display(sc);

    }
}