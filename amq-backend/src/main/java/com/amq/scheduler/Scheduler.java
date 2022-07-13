package com.amq.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.amq.repositories.RepositoryReserva;

@Component
public class Scheduler {
	@Autowired
	RepositoryReserva repoR;
	
	@Scheduled(cron = "0 * * * * *")
	public void setReservaEjecutada() {
		repoR.setReservasEjecutadas();
	    System.out.println("SCHEDULER OK!");
	}
}
