
class Teacher {
    void display() {
        System.out.println("teacher class");
    }
}
class Student1 extends Teacher {
    void display() {
        System.out.println("student1 class");
    }
}
class Student2 extends Teacher {
    // void display() {
    //     System.out.println("student2 class");
    // }
}
public class HierarchicalInheritance {
    public static void main(String[] args) {
        Student2 s2 = new Student2();
        s2.display();
    }
}
