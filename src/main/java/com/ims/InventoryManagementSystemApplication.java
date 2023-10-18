package com.ims;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.ims.unit.UnitRepository;

@SpringBootApplication
public class InventoryManagementSystemApplication implements ApplicationRunner {
	
	private static Logger LOGGER = LoggerFactory.getLogger(InventoryManagementSystemApplication.class);
	public static void main(String[] args) {
		SpringApplication.run(InventoryManagementSystemApplication.class, args);
	}

	@Override
	public void run(ApplicationArguments args) throws Exception {
	}

}
