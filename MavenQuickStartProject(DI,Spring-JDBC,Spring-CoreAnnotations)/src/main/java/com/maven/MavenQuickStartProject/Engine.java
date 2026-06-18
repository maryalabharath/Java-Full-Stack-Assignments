package com.maven.MavenQuickStartProject;

import org.springframework.beans.factory.annotation.Value;
//import org.springframework.stereotype.Component;


public class Engine {
	@Value("Petrol Engine")
    private String type;
	
	void startEngine() {
		System.out.println("Engine starting...");
		System.out.println(type);
		}
}
