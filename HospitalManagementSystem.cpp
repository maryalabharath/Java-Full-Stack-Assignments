#include <iostream>
using namespace std;

class HospitalManagementSystem {
    int patientId;
    string problem, patientName, doctorAssigned;
    //details of the patient
    public:
        void displayPatientDetails() {
            cout << "Patient ID: ";
            cin >> patientId;

            cout << "patient name: ";
            cin >> problem;

            cout << "problem: ";
            cin >> patientName;

            cout << "doctor assigned: ";
            cin >> doctorAssigned;  
    }

    void display() {
        cout << "PatientId: " << patientId << endl;
        cout << "problem: " << problem << endl;
        cout << "patient name: " << patientName << endl;
        cout << "doctor Assigned: " << doctorAssigned << endl;
    }
};

int main() {
    HospitalManagementSystem h;
    h.displayPatientDetails();
    h.display();
}
