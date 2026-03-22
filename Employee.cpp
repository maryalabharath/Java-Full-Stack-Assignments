//Employee Salary System
#include <iostream>
using namespace std;

class Employee {
    string name;
    int empId;
    float salary;
    
    
    //creating constructor
    public:
    Employee(string n, int i, float s) {
        name = n;
        empId = i;
        salary = s;
    }
    
    void display() {
        cout << "Name: " << name << endl;
        cout << "empid: " << empId << endl;
        cout << "salary: " << salary << endl;
    }
};

int main() {
    //object creation
    Employee e1("shiva", 1212, 4000.221);
    e1.display();
    
}