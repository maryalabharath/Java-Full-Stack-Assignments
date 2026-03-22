#include<iostream>
using namespace std;

class Vehicle {
private:
    string model;
    string manufacturer;
    int price;
//input method
public:
    void input() {
        cout<<"Enter Model: ";
        cin>>model;
        cout<<"Enter Manufacturer: ";
        cin>>manufacturer;
        cout<<"Enter Price: ";
        cin>>price;
    }
//display method
    void display() {
        cout<<"Model: "<<model;
        cout<<"Manufacturer: "<<manufacturer;
        cout<<"Price: "<<price<<endl;
    }
};
//main method
int main() {
    Vehicle v;
    v.input();
    v.display();
}