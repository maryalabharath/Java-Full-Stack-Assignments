#include<iostream>
using namespace std;

class Hotel {
private:
    string customerName;
    int roomNumber;
    int days;
    int rent = 1000;
//input method
public:
    void input() {
        cout<<"Enter Customer Name: ";
        cin>>customerName;
        cout<<"Enter Room Number: ";
        cin>>roomNumber;
        cout<<"Enter Number of Days: ";
        cin>>days;
    }
//total bill method
    void bill() {
        cout<<"Customer Name: "<<customerName;
        cout<<"Room Number: "<<roomNumber;
        cout<<"Total Bill: "<<days * rent<<endl;
    }
};
//main method
int main() {
    Hotel h;
    h.input();
    h.bill();
}