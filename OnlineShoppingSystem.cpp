#include<iostream>
using namespace std;

class Product {
private:
    string name;
    int price;
    int quantity;
    int total;
//input method
public:
    void input() {
        cout<<"Enter Product Name: ";
        cin>>name;
        cout<<"Enter Price: ";
        cin>>price;
        cout<<"Enter Quantity: ";
        cin>>quantity;
        total = price * quantity;
    }
//display method
    void display() {
        cout<<"Product: "<<name;
        cout<<"Total Bill: "<<total<<endl;
    }
};

int main() {
    Product p;
    p.input();
    p.display();
}