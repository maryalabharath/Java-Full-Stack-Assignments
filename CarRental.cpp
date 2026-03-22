#include <iostream>
using namespace std;

class Car {
    public:
    string carName;
    float rentPerDay;
    int days;
    float total;
//details of the car
    public:
    void detailsOfCars() {
        cout << "enter car name: ";
        cin >> carName;

        cout << "enter the rent per day: ";
        cin >> rentPerDay;

        cout << "enter the number of days: ";
        cin >> days;

        total = rentPerDay * days;
    }
//total amount
    void totalamt() {
        cout << "car name: " << carName << endl;
        cout << "total amt: " << total << endl;
    }
};
//main method
int main() {
    Car c;
    c.detailsOfCars();
    c.totalamt();
}