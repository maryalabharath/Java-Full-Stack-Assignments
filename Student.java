class Student {
public static void main(String[] args){
    String s1="java";
    String s2="programming";
   String s3=s1.concat(s2);
  System.out.println(s1.length());
   System.out.println(s1.charAt(0));
  System.out.println(s1);
    System.out.println(s3);
    System.out.println(s1.toUpperCase());
    System.out.println(s2.toLowerCase());
    System.out.println(s3.trim());//removes spaces at begin and end
    System.out.println(s3.contains("pro"));
  System.out.println(s1.substring(0,3));

}
}
