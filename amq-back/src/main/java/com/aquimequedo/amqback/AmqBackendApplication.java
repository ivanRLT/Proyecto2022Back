package com.aquimequedo.amqback;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class }) 
public class AmqBackendApplication {
	public static void main(String[] args) {
		SpringApplication.run(AmqBackendApplication.class, args);
	}
}
