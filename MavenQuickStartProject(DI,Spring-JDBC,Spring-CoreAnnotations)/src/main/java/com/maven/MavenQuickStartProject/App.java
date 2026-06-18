package com.maven.MavenQuickStartProject;
// Importing required classes
import java.sql.SQLException;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

// Main class
public class App{
    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        
        // Initialize Spring Application Context
       
//		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
//
//        // Retrieve bean
//		StudentJDBCTemplate studentJDBCTemplate = (StudentJDBCTemplate)context.getBean("StudentJDBCTemplate");
//
//        // Call method to fetch student records
//		 System.out.println("------Listing Multiple Records--------" );
//	      List<Student> students = studentJDBCTemplate.ListStudents();
//	      
//		  // print all the students
//	      for (Student record : students) {
//	         System.out.print("ID : " + record.getStudentId() );
//	         System.out.print(" Name : " + record.getStudentName() );
//	         System.out.print(" Fee : " + record.getHostelFee());
//	         System.out.println(" FoodType : " + record.getFoodType());
//	      }
    	
    	ApplicationContext context= new AnnotationConfigApplicationContext(AppConfig.class);
    	
    	Car car= context.getBean(Car.class);
    	car.startCar();
    	
    	
    }
}

