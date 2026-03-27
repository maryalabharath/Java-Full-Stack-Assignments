abstract class Shape {
    abstract void draw();
}

class Rectangle extends Shape {
    void draw() {
        System.out.println("Rectangle");
    }
}

class Circle extends Shape {
    void draw() {
        System.out.println("Circle");
    }
}

class Square extends Shape {
    void draw() {
        System.out.println("Square");
    }
}

public class AbstractClass {
    public static void main(String[] args) {
        Rectangle r = new Rectangle();
        Circle c = new Circle();
        Square s = new Square();

        r.draw();
        c.draw();
        s.draw();
    }
}