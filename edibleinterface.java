package interfaces;

public interface edible {
    void foods();
}

class Chicken implements edible {
    public void foods() {
        System.out.println("Chicken is a food and it is edible");
    }
}

class Orange implements edible {
    public void foods() {
        System.out.println("Orange is a fruit and it is edible");
    }
}

class Plastic implements edible {
    public void foods() {
        System.out.println("Plastic is not edible");
    }
}

 class edibles {
    public static void main(String[] args) {

        edible e;

        e = new Chicken();
        e.foods();

        e = new Orange();
        e.foods();

        e = new Plastic();
        e.foods();
    }
}