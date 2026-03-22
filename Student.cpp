//1.student information System 
#include <iostream>
using namespace std;

class StudentInfo {
    string name;
    int age;
    int roll;

    // constructor
    public:
    StudentInfo(string n, int a, int r) {
        name = n;
        age = a;
        roll = r;
    }

    void display() {
        cout << "Name: " << name << endl;
        cout << "roll: " << roll << endl;
        cout << "age: " << age << endl;
    }
};

int main() {
    //objecct creation
    StudentInfo s1("shiva kumar", 22, 7236 );
    s1.display();
    
    StudentInfo s2("nihar", 22, 7236 );
    s2.display();
    
    StudentInfo s3("pradeep", 22, 7236 );
    s3.display();
    
    StudentInfo s4("tharun", 22, 7236 );
    s4.display();
    
    StudentInfo s5("mani", 22, 7236 );
    s5.display();
}





