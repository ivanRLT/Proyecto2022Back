package com.amq.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.amq.datatypes.DtAlojamiento;
import com.amq.datatypes.DtHabitacion;
import com.amq.mail.MailSender;
import com.amq.mail.Mensaje;
import com.amq.model.Alojamiento;
import com.amq.model.Anfitrion;
import com.amq.model.Habitacion;
import com.amq.model.Usuario;
import com.amq.repositories.RepositoryAlojamiento;
import com.amq.repositories.RepositoryUsuario;

@CrossOrigin(origins = "http://localhost:8081")
@RestController
@RequestMapping("/api")
public class ControladorAlojamiento {
	
	@Autowired
	RepositoryUsuario repoU;
	
	@Autowired
	RepositoryAlojamiento repoA;
	
	// #######################Funciones de alojamiento#######################
	
	@PostMapping("/altaAlojamiento/{id}")
	public ResponseEntity<Alojamiento> altaAlojamiento(@RequestBody DtAlojamiento alojDT, @PathVariable("id") int idAnf) {
		try {
			Optional<Usuario> opU = repoU.findById((long) idAnf);
			Anfitrion anf = null;
			if (opU.isPresent()) {
				if (opU.get() instanceof Anfitrion) {
					anf = (Anfitrion) opU.get();
					Alojamiento alojamiento = new Alojamiento();
					alojamiento.setAnfitrion(anf);
					alojamiento.setDescripcion(alojDT.getDescripcion());
					alojamiento.setDireccion(alojDT.getDirecion());
					alojamiento.setHabitaciones(null);
					alojamiento.setNombre(alojDT.getNombre());
					anf.agregarAlojamiento(alojamiento);
					Alojamiento alojR = repoA.save(alojamiento);
					return new ResponseEntity<>(alojR, HttpStatus.CREATED);
				}else {
					return new ResponseEntity<>(HttpStatus.NOT_ACCEPTABLE);
				}
			} else {
				return new ResponseEntity<>(HttpStatus.NOT_FOUND);
			}
		} catch (Exception e) {

		}
		return null;
	}
	
	@PostMapping("/agregarHabitaciones/{id}")
	public ResponseEntity<Alojamiento> agregarHabitacionesAlojamiento(@PathVariable("id") int idAlo, @RequestBody List<DtHabitacion> habiDTs) {
		try {
			Optional<Alojamiento> opA = repoA.findById((long) idAlo);
			if (opA.isPresent()) {
				List<Habitacion> habitaciones = new ArrayList<Habitacion>();
				Alojamiento alojamiento = opA.get();
				for(DtHabitacion h:habiDTs) {
					Habitacion hab = new Habitacion();
					hab.setAlojamiento(alojamiento);
					hab.setCamas(h.getCamas());
					hab.setDescripcion(h.getDescripcion());
					hab.setPrecioNoche(h.getPrecioNoche());
					hab.setReservas(null);
					hab.setServicios(h.getDtservicios());
					habitaciones.add(hab);
				}
				alojamiento.setHabitaciones(habitaciones);
				repoA.save(alojamiento);
				return new ResponseEntity<>(HttpStatus.OK);
			} else {
				return new ResponseEntity<>(HttpStatus.NOT_FOUND);
			}
		} catch (Exception e) {

		}
		return null;
	}
	
	public boolean modificarAlojamiento() {
		Boolean retorno = false;
		try {
			
		} catch (Exception e) {
			retorno = false;
		}	
		return retorno;
	}
	public void buscarAlojamiento(int id) {
		
		try {

		} catch (Exception e) {
			// TODO: handle exception
		}	
		//return dtAlojamiento
	}
	public Boolean desactivarAlojamiento() {
		Boolean retorno = false;
		try {

			
		} catch (Exception e) {
			retorno = false;
		}	
		return retorno;
	}
	public DtAlojamiento listarAlojamientos() {
		try {
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	// #######################Funciones de habitacion#######################
	public Boolean agregarHabitaciones(int idAlojamiento, List<DtHabitacion> dtHabitacion) {
		Boolean retorno = false;
		try {

			retorno = true;
		} catch (Exception e) {
			retorno = false;
		}
		return retorno;
	}
	public DtHabitacion consultaHabitacion(int idAlojamiento, int idHabitacion) {
		try {	
			
		} catch (Exception e) {
		}
		return null;
	}
	public List<DtHabitacion> listarHabitaciones(int idAlojamiento) {
		try {

		} catch (Exception e) {

		}
		return null;
	}
	public Boolean modificarHabitaciones(int idAlojamiento, List<DtHabitacion> dtHabitacion) {
		Boolean retorno = false;
		try {
			
			retorno = true;
		} catch (Exception e) {
			retorno = false;
		}
		return retorno;
	}
	
	//De prueba, se puede borrar
	@RequestMapping(value = "/mail/enviar", method = { RequestMethod.POST,  RequestMethod.GET })
	public void enviarMail(@RequestBody Mensaje msj) {
		try {
			MailSender mailSender = new MailSender();
			mailSender.enviarMail(msj);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
