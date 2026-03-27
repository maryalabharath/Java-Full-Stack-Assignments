class A {
    void display() {
        System.out.println("class A");
    }
}
class B extends A {
    void display() {
        System.out.println("class B");
    }
}
class C extends B {
    // void display() {
    //     System.out.println("class c");
    // }
}
public class MultiLevel {
    public static void main(String[] args) {
        C c = new C();
        c.display();
    }
}