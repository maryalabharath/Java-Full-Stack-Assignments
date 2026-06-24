public class StringObj {
public static void main(String[] args) {
        String a = "java";
        String b = new String("java");
        System.out.println(a == b);
        System.out.println(a.equals(b));
}
}