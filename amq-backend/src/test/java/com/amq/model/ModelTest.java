package com.amq.model;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.Assert.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.List;

//import static org.junit.Assert.*;
import org.junit.jupiter.api.Test;
import org.mockito.Mock;
//import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase.Replace;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.TestPropertySource;

import com.amq.datatypes.DtFecha;
import com.amq.datatypes.DtIdValor;
import com.amq.datatypes.DtUsuario;
import com.amq.enums.ReservaEstado;
import com.amq.repositories.RepositoryReserva;
import com.amq.repositories.RepositoryResetPassword;
import com.amq.repositories.RepositoryUsuario;
import com.amq.model.*;

//Persista en la base.
@AutoConfigureTestDatabase(replace = Replace.NONE)
//@TestPropertySource(locations = "classpath:test.properties")
@TestPropertySource(locations = "classpath:application.properties")

@DataJpaTest
public class ModelTest {
	
	@Autowired
	private RepositoryReserva repoReserva;
	
	@Autowired
	private RepositoryUsuario repoUsr;
	
//	@Autowired
//	private RepositoryResetPassword repoTokenRepository;
	
//	@Autowired
//	private PasswordResetToken prt;
//	
//	@Autowired
//	@Mock
//	private Usuario usr;
	

	@Test
//	para cuando se persiste en base.
//	@Rollback(false) 
	public void testPersistirReserva() {
		Huesped hue = new Huesped();
		DtFecha dtfechaI = new DtFecha(16, 6, 222);
		DtFecha dtfechaF = new DtFecha(26, 6, 222);
		Habitacion ab = new Habitacion();
		
		ab.setId(1);
		hue.setId(1);
		
		Reserva reserva = new Reserva(1, null, 5, ReservaEstado.PENDIENTE, dtfechaI, dtfechaF, ab, null);
		repoReserva.save(reserva);
		
		assertNotNull(reserva);
	}
	
	@Test
	public void testPersistirTokenResetPassword() {
//		usr.setId(22);
//		prt.getUsuario().getClass();
//		prt.setToken("fbacf4a2-fc54-40e9-961f-0ab3b53af28e");
//		repoTokenRepository.save(prt);
		Huesped s = new Huesped();
//		PasswordResetToken prt = new PasswordResetToken("string", s);
//		PasswordResetToken p = new PasswordResetToken();
		
		
		
//		repoReserva.findReservasXHuespConEstado(2, )
	}
	
	@Test
	public void testBuscarUsuarioPorNombre(){
		
		String email = "pepe@gmail.com";
		Usuario usr = repoUsr.findByEmail(email);
		
		equals(usr.getEmail());
	}
	
	@Test
	@Rollback(false)
	public void testListUsrTieneReservaAlojamiento() {
		List<DtIdValor> usrTRA = repoReserva.usrTieneReservaEnAlojamiento(116, 10072);
		
//		for 

		
		assertThat(usrTRA).size().isGreaterThan(0);
	}
	
	
	@Test
	@Rollback(false)
	public void testreservasEjecutadasAnf() {
		List<Reserva> res = repoReserva.reservasEjecutadasAnf(351);
		assertThat(res).size().isGreaterThan(0);
	}
	
	
	
	
	

}
