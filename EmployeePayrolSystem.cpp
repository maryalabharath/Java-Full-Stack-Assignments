#include <iostream>
using namespace std;

class EmployeePayrolSystem {
    private:
    string Name;
    int Empid;
    float Salary;
// detals of the employee
    public:
    void DetailsOfEmployee() {
        cout << "enter name: ";
        cin >> Name;

        cout << "employee Id: ";
        cin >> Empid;
        
        cout << "Salary: ";
        cin >> Salary;

    }
//display method
    void display() {
        cout << "name: " << Name << endl;
        cout << "employee is: " << Empid << endl;
        cout << "salary: " << Salary << endl;
    }
//total salary
    void TotalSalary() {
        cout << "total salary is: " << 12*Salary << endl;
    }

};
//main method
int main() {
    EmployeePayrolSystem e, e1;
    e.DetailsOfEmployee();
    e.display();
    e.TotalSalary();

    e1.DetailsOfEmployee();
    e1.display();
    e1.TotalSalary();
}