#include<iostream>
using namespace std;

class ATM {
private:
    int balance;

public:
//constructor
    ATM() {
        balance = 1000;
    }
    //deposite method
    void deposit(int amount) {
        balance += amount;
        cout<<"Deposited Successfully\n";
    }
    //withdraw method
    void withdraw(int amount) {
        if(amount <= balance) {
            balance -= amount;
            cout<<"Withdrawal Successful\n";
        }
        else {
            cout<<"Insufficient Balance\n";
        }
    }
    //balance method
    void checkBalance() {
        cout<<"Current Balance: "<<balance<<endl;
    }
};

int main() {
    //object creation
    ATM a;
    int choice, amount;

    cout<<"1.Deposit\n2.Withdraw\n3.Check Balance\n";
    cin>>choice;

    switch(choice) {
        case 1:
            cout<<"Enter Amount: ";
            cin>>amount;
            a.deposit(amount);
            break;

        case 2:
            cout<<"Enter Amount: ";
            cin>>amount;
            a.withdraw(amount);
            break;

        case 3:
            a.checkBalance();
            break;
    }
}