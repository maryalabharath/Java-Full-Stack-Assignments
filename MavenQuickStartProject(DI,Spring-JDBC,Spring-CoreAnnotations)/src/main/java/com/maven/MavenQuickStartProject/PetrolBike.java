package com.maven.MavenQuickStartProject;

import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Component;

@Component
@Primary
public class PetrolBike implements Bike {

	@Override
	public void start() {
		System.out.print("Petrol bIke starting ");
		
	}

}
