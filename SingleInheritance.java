class Parent {
    void dispay() {
        System.out.println("parent class");
    }
}
class Child extends Parent{
    void display() {
        System.out.println("child class");
    }
}
public class SingleInheritance {
    public static void main(String[] args) {
        Child c = new Child();
        c.display();
    }
}