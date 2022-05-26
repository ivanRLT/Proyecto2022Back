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
import com.amq.datatypes.DtDireccion;
import com.amq.datatypes.DtHabitacion;
import com.amq.datatypes.DtServicios;
import com.amq.model.Alojamiento;
import com.amq.model.Anfitrion;
import com.amq.model.Habitacion;
import com.amq.model.Usuario;
import com.amq.notification.FirebaseNotificationAdmin;
import com.amq.repositories.RepositoryAlojamiento;
import com.amq.repositories.RepositoryDireccion;
import com.amq.repositories.RepositoryHabitacion;
import com.amq.repositories.RepositoryServicios;
import com.amq.repositories.RepositoryUsuario;
import com.google.firebase.messaging.Notification;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/alojamiento")
public class ControladorAlojamiento {
	
	@Autowired
	RepositoryUsuario repoU;
	
	@Autowired
	RepositoryAlojamiento repoA;
	
	@Autowired
	RepositoryDireccion repoDir;
	
	@Autowired
	RepositoryServicios repoSer;
	
	@Autowired
	RepositoryHabitacion repoHab;
	
	// #######################Funciones de alojamiento#######################
	
	@RequestMapping(value = "/alta/{id}", method = { RequestMethod.POST,  RequestMethod.GET })
	public ResponseEntity<Alojamiento> altaAlojamiento(@RequestBody DtAlojamiento alojDT, @PathVariable("id") int idAnf) {
		try {
			Optional<Usuario> opU = repoU.findById(idAnf);
			Anfitrion anf = null;
			if (opU.isPresent()) {
				if (opU.get() instanceof Anfitrion) {
					anf = (Anfitrion) opU.get();
					Alojamiento alojamiento = new Alojamiento();
					DtDireccion direccion = alojDT.getDirecion();
					repoDir.save(direccion);
					alojamiento.setAnfitrion(anf);
					alojamiento.setDescripcion(alojDT.getDescripcion());
					alojamiento.setDireccion(direccion);
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
			System.out.println(e.toString());
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@RequestMapping(value = "/agregarHabitaciones/{id}", method = { RequestMethod.POST,  RequestMethod.GET })
	public ResponseEntity<Habitacion> agregarHabitacionesAlojamiento(@PathVariable("id") int idAlo, @RequestBody DtHabitacion habitacion) {
		try {
			Optional<Alojamiento> opA = repoA.findById(idAlo);
			if (opA.isPresent()) {
				Alojamiento alojamiento = opA.get();
				Habitacion hab = new Habitacion();
				DtServicios servicios = habitacion.getDtservicios();
				repoSer.save(servicios);
				hab.setAlojamiento(alojamiento);
				hab.setCamas(habitacion.getCamas());
				hab.setDescripcion(habitacion.getDescripcion());
				hab.setPrecioNoche(habitacion.getPrecioNoche());
				hab.setReservas(null);
				hab.setServicios(servicios);
				alojamiento.agregarHabitacion(hab);
				Habitacion habR = repoHab.save(hab);
				repoA.save(alojamiento);
				
				return new ResponseEntity<>(habR, HttpStatus.CREATED);
			} else {
				return new ResponseEntity<>(HttpStatus.NOT_FOUND);
			}
		} catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
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
	public void enviarMail(@RequestBody com.amq.mail.Mensaje msj) {
		try {
			com.amq.mail.MailSender mailSender = new com.amq.mail.MailSender();
			mailSender.enviarMail(msj);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	//De prueba, se puede borrar
	@RequestMapping(value = "/notif", method = { RequestMethod.POST,  RequestMethod.GET })
	public void enviarNotificacion() {
		try {
			com.amq.notification.FirebaseNotificationAdmin notAdmin = new FirebaseNotificationAdmin();
			com.google.firebase.messaging.Notification not  = Notification.builder()
					.setTitle("titulo notif")
					.setBody("body notif")
					.build();
			List<String> tokens = new ArrayList<String>();
			tokens.add("c-n-W0NzjpoKM0bk8rDhlO:APA91bGHtu3XCYy19Xb126XUODA4vMUT-3IftN0LfdU_V-SJ5PFt86wJ1HJJo6Bzp3rj_FZ60_nwHmib5iZi4t67qyb2Moam1Bikxb0n6nsi5OHEWgxDietHmi2dDXagKV-Ch2s-_PHd");
			tokens.add("c-n-W0NzjpoKM0bk8rDhlO:APA91bGHtu3XCYy19Xb126XUODA4vMUT-3IftN0LfdU_V-SJ5PFt86wJ1HJJo6Bzp3rj_FZ60_nwHmib5iZi4t67qyb2Moam1Bikxb0n6nsi5OHEWgxDietHmi2dDXagKV-Ch2s-_P3d");
			notAdmin.sendNotification(not, tokens);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
}
