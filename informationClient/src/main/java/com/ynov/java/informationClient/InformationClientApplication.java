package com.ynov.java.informationClient;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;


@SpringBootApplication
@EnableJpaRepositories("com.ynov.java.informationClient.dao")
@EntityScan("com.ynov.java.informationClient.model")
public class InformationClientApplication {

	public static void main(String[] args) {
		SpringApplication.run(InformationClientApplication.class, args);
		
	}

}
