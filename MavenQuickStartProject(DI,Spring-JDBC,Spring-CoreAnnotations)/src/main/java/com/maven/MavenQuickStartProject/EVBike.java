package com.maven.MavenQuickStartProject;

import org.springframework.stereotype.Component;

@Component
public class EVBike implements Bike{

	@Override
	public void start() {
		System.out.print("EV bIke starting ");
		
	}
	

}
