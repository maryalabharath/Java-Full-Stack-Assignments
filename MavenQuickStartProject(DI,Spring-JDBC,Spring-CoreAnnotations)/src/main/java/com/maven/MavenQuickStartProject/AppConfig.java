package com.maven.MavenQuickStartProject;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan("com.maven")
public class AppConfig {
	 @Bean
	    public Engine engine() {
	        return new Engine();
	    }
	
}
