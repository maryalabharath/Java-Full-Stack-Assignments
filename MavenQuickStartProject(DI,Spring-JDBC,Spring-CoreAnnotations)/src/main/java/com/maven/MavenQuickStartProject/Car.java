package com.maven.MavenQuickStartProject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

@Component 
public class Car {
   @Autowired
   private Engine engine;
   @Autowired
   @Qualifier("EVBike")
   private Bike bike;
   
  
   void startCar() {
	   engine.startEngine();
	   System.out.println("car starting ....");
	   bike.start();
   }
}
