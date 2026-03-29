package interfaces;

interface Books {
    void uses();
}

class TextBooks implements Books {
    public void uses() {
        System.out.println("Text books are used to print chapters and the subject");
    }
}

class Notebooks implements Books {
    public void uses() {
        System.out.println("Notebooks are used to take desired notes from textbooks");
    }
}
class books{
    public static void main(String[] args) {

        Books b;

        b = new TextBooks();
        b.uses();

        b = new Notebooks();
        b.uses();
    }
}