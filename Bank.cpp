//Bank account System
#include <iostream>
using namespace std;

//creating class
class BankHolders {
   
    string name;
    string accNo;
    string add;
    string ifcsCode;
    
    
    //creating constructor
    public:
    BankHolders(string n, string a, string ad, string i) {
    name = n;
    accNo = a;
    add = ad;
    ifcsCode = i;
        
    }
    
    void display() {
        cout << "name: " << name;
        cout << "accno: " << accNo;
        cout << "add: " << add;
        cout << "ifcsCode: " << ifcsCode;
    }
};

//main function
int main() {
    //object creation
    BankHolders b1("shiva", "1354646762656", "palamakula", "hkuyhj455772472");
    b1.display();
}