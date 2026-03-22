#include <iostream>
using namespace std;

class LibraryManagementSystem {
    private:
    int BookId;
    string Title;
    string AuthorName;

    public:
//takin input
    void BooksInput() {
        cout << "==========Enter the Detaild of the Books==========";
        cout << "Enter the Book Id: ";
        cin >> BookId;

        cout << "Enter Book Title: ";
        cin >> Title;

        cout << "Enter Auther Name: ";
        cin >> AuthorName;
    }
//display method
    void display() {
        cout << "========= Details of  the Books =========" << endl;
        cout << "BookId: " << BookId << endl;
        cout << "title: " << Title << endl;
        cout << "AuthorName: " << AuthorName << endl;
    }
};
//main method
int main() {
    LibraryManagementSystem l, l1;
    l.BooksInput();
    l1.BooksInput();

    l.display();
    l1.display();
}
