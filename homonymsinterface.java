package interfaces;


interface homonyms {
    void uses();
}


class Electronics implements homonyms {
    public void uses() {
        System.out.println("In electronics, a switch is used for turning on and off");
    }
}

class Position implements homonyms {
    public void uses() {
        System.out.println("In games, a switch is used for changing positions or players with others");
    }
}


class TestHomonyms {
    public static void main(String[] args) {
        homonyms h;

        h = new Electronics();
        h.uses();

        h = new Position();
        h.uses();
    }
}