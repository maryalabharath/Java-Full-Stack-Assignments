#include <iostream>
using namespace std;

class BankManagementSystem {
    private:
    string name;
    string AccNo;
    float AccBal;

    //details of the employee
    public:
    void createAcc(string n, string a, float b) {
        name = n;
        AccNo = a;
        AccBal = b;
    }
    //deposite method
    void deposite(double amount) {
        AccBal += amount;
    }
    //withdraw method
    void withdraw(double amount) {
        if(AccBal > amount) {
            AccBal -= amount;
        }else {
            cout << "insufficient funds!";
        }
    }
    //display balance
    void displayBal() {
        cout << "total balance is: " << AccBal;
    }
};

int main() {
    BankManagementSystem b;
    b.createAcc("shiva", "12khsn1275562jghjs", 1000);
    b.deposite(500);
    b.withdraw(1000);
    b.displayBal();
}