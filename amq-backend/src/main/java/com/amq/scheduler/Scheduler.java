package com.amq.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.amq.repositories.RepositoryReserva;
import com.amq.repositories.RepositoryResetPassword;

@Component
public class Scheduler {
	@Autowired
	RepositoryReserva repoR;
	
	@Autowired
	RepositoryResetPassword repoPass;
	
	@Scheduled(cron = "0 1 1 * * *")
	public void setReservaEjecutada() {
		repoR.setReservasEjecutadas();
	    System.out.println("SCHEDULER: se ejecutó proceso de seteo de estado de reservas ejecutadas.");
	}
	
	@Scheduled(cron = "0 * * * * *")
	public void limpiarPasswordResetTokens() {
		repoPass.limpiarVencidos();
		System.out.println("SCHEDULER: se ejecutó proceso de limpieza de tokens de reseteo de contraseña vencidos.");
	}
}
