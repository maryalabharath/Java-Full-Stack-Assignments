import java.util.Scanner;

class Bank{
    String name;
    String phno;
    String type;
    int total;
    Bank() {
        total = 0;
    }
    void create(Scanner sc){
        System.out.println("enter the account Holder name:");
        name =sc.nextLine();
        System.out.println("enter phone number:");
        phno=sc.nextLine();
        System.out.println("enter type of account(business/personal):");
        type=sc.nextLine();
        return;
    }
    void deposite(Scanner sc){
        int depo;
        System.out.println("enter the amount to deposite");
        depo=sc.nextInt();
        total=total+depo;
        System.out.println("amount added successfully\n");
        return;
    }
    void withdraw(Scanner sc){
        int wd;
        System.out.println("enter the amount to withdraw");
        wd=sc.nextInt();
        if(wd<=total){total=total-wd;}
        else{
            System.out.println("insufficient balance\n");
        }

        return;
    }
    void checkb(){
        System.out.println("your total balance is:"+total);
    }


};
class Main {
    public static void main(String[] args) {
        String ch1, ch3;
        int ch2;
        Bank b = new Bank();
        Scanner sc = new Scanner(System.in);
        System.out.println(" do you want to create an account(y/n):");
        ch1 = sc.nextLine();
        if (ch1.equals("y")) {
            b.create(sc);
        }
        do{
            System.out.println("enter the option:\n1.deposite\n2.withdraw\n3.check balance");
            ch2=sc.nextInt();
            switch(ch2){
                case 1:
                    b.deposite(sc);
                    break;
                case 2:
                    b.withdraw(sc);
                    break;
                case 3:
                    b.checkb();
                    break;
            }
            sc.nextLine();
            System.out.println("do you want perform another action(y/n)");
            ch3=sc.nextLine();
        }while(ch3.equalsIgnoreCase("y"));
    }
}



