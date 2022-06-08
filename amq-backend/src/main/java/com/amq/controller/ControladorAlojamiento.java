package com.amq.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.amq.datatypes.DtAlojamiento;
import com.amq.datatypes.DtDireccion;
import com.amq.datatypes.DtFiltrosAlojamiento;
import com.amq.datatypes.DtHabitacion;
import com.amq.datatypes.DtReserva;
import com.amq.datatypes.DtSelectInfo;
import com.amq.datatypes.DtServicios;
import com.amq.datatypes.DtUsuario;
import com.amq.model.Alojamiento;
import com.amq.model.Anfitrion;
import com.amq.model.Habitacion;
import com.amq.model.Reserva;
import com.amq.model.Usuario;
import com.amq.notification.FirebaseNotificationAdmin;
import com.amq.repositories.RepositoryAlojamiento;
import com.amq.repositories.RepositoryDireccion;
import com.amq.repositories.RepositoryHabitacion;
import com.amq.repositories.RepositoryPais;
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
	RepositoryPais repoPais;
	
	@Autowired
	RepositoryServicios repoSer;
	
	@Autowired
	RepositoryHabitacion repoHab;
	
	// #######################Funciones de alojamiento#######################
	
	@RequestMapping(value = "/alta/{id}", method = { RequestMethod.POST })
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
	
	@RequestMapping(value = "/agregarHabitaciones/{id}", method = { RequestMethod.POST })
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
	
	@RequestMapping(value = "/modificarAljamiento/{id}", method = { RequestMethod.POST })
	public ResponseEntity<Alojamiento> modificarAlojamiento(@PathVariable("id") int id, @RequestParam Boolean activo, @RequestParam String descripcion, @RequestParam String nombre, @RequestParam Boolean cambioDir, DtDireccion direccion) {
		try {
			Optional<Alojamiento> opA = repoA.findById(id);
			if (opA.isPresent()) {
				Alojamiento alojamiento = opA.get();
				alojamiento.setActivo(activo);
				alojamiento.setDescripcion(descripcion);
				alojamiento.setNombre(nombre);
				Boolean existeDir = false;
				int idDir = alojamiento.getDireccion().getId();
				if (cambioDir) {
					List<DtDireccion> direcciones = repoDir.findAll();
					for (DtDireccion dir : direcciones) {
						if (dir.getPais().getId() == direccion.getPais().getId() && dir.getCiudad() == direccion.getCiudad() && dir.getCalle() == direccion.getCalle() && dir.getNumero() == direccion.getNumero() ) {
							existeDir = true;
						}
					}
					if (!existeDir) {
						Optional<DtDireccion> opDir = repoDir.findById(idDir);
						if (opDir.isPresent()) {
							DtDireccion direccionAnt = opDir.get();
							direccionAnt.setCalle(direccion.getCalle());
							direccionAnt.setCiudad(direccion.getCiudad());
							direccionAnt.setNumero(direccion.getNumero());
							direccionAnt.setPais(direccion.getPais());
							repoDir.save(direccionAnt);
							Alojamiento alojR = repoA.save(alojamiento);
							return new ResponseEntity<>(alojR, HttpStatus.OK);
						}else {
							return new ResponseEntity<>(HttpStatus.NOT_FOUND);
						}
					}
					return new ResponseEntity<>(HttpStatus.CONFLICT);
				}else {
					Alojamiento alojR = repoA.save(alojamiento);
					return new ResponseEntity<>(alojR, HttpStatus.OK);
				}		
			} else {
				return new ResponseEntity<>(HttpStatus.NOT_FOUND);
			}
		} catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	public void buscarAlojamiento(int id) {
		
		try {

		} catch (Exception e) {
			// TODO: handle exception
		}	
		//return dtAlojamiento
	}
	
	@RequestMapping(value = "/desactivarAlojamiento/{id}", method = { RequestMethod.POST })
	public ResponseEntity<Boolean> desactivarAlojamiento(@PathVariable("id") int idAlo ) {
		Alojamiento a;
		try {
			Optional<Alojamiento> optA = repoA.findById(idAlo);
			if(!optA.isPresent()) {
				return new ResponseEntity<>( HttpStatus.NOT_FOUND);
			}
			a = optA.get();
			a.setActivo(false);
			repoA.save(a);
			return new ResponseEntity<>(HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}	
		
	}
	
	//public ResponseEntity<List<DtUsuario>> listarUsuarios() {

	@RequestMapping(value = "/listarAlojamientos", method = { RequestMethod.POST })
	public ResponseEntity<List<DtAlojamiento>> listarAlojamientos(@RequestBody DtFiltrosAlojamiento filtros) {

		List<Alojamiento> alojs = new ArrayList<Alojamiento>();
		List<DtAlojamiento> dtAlojs = new ArrayList<DtAlojamiento>();
		List<DtHabitacion> dtHabs = new ArrayList<DtHabitacion>();
		DtHabitacion dtHab;
		DtAlojamiento dtA;
		Boolean filtrarHabitaciones;
		try {
			repoA.findAll().forEach(alojs::add);
			filtrarHabitaciones = filtroAfectaHab(filtros);
			for (Alojamiento a : alojs) {
				dtHabs = new ArrayList<DtHabitacion>();
				if( alojCumpleFiltro( a, filtros ) ){
					dtA = new DtAlojamiento(
							a.getId(),
							a.getActivo(), 
							a.getDescripcion(), 
							a.getDireccion(), 
							a.getNombre()
						);
					for( Habitacion hab : a.getHabitaciones() ) {
						//Si no desea aplicar filtro de habitaciones o desea aplicar filtros y estos se cumplen
						if( !filtrarHabitaciones || habCumpleFiltro(hab, filtros) ) {
							dtHab = new DtHabitacion(
									hab.getDescripcion(), 
									hab.getPrecioNoche(), 
									hab.getCamas(), 
									hab.getServicios());
							dtHabs.add(dtHab);
						}
					}
					if( !filtrarHabitaciones || dtHabs.size()>0) {
						dtAlojs.add(dtA);
					}
				}
			}
			if (dtAlojs.isEmpty()) {
				return new ResponseEntity<>(HttpStatus.NO_CONTENT);
			} else {
				return new ResponseEntity<>(dtAlojs, HttpStatus.OK);
			}
		} catch (Exception e) {
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
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
	@RequestMapping(value = "/reservasAlojamiento/{id}", method = { RequestMethod.GET })
	public ResponseEntity<List<DtReserva>> obtenerReservasAlojamiento(int id ) {
		try {
			Optional<Alojamiento> opA = repoA.findById(id);
			if (opA.isPresent()) {
				Alojamiento alojamiento = opA.get();
				List<Habitacion> habitaciones = alojamiento.getHabitaciones();
				List<DtReserva> reservasDT = new ArrayList<DtReserva>();
				for (Habitacion h : habitaciones) {
					List<Reserva> reservasH = h.getReservas();
					for (Reserva r : reservasH) {
						DtReserva rdt = new DtReserva(r.getEstado(), r.getDtFechaInicio(), r.getDtFechaFin(), r.getIdChat(), r.getCantDias(), null, null);
						reservasDT.add(rdt);
					}
				}
				if (reservasDT.isEmpty()) {
					return new ResponseEntity<>(HttpStatus.NO_CONTENT);
				}else {
					return new ResponseEntity<>(reservasDT, HttpStatus.OK);
				}
			}else {
				return new ResponseEntity<>(HttpStatus.NOT_FOUND);
			}
		} catch (Exception e) {
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}

	}
	@RequestMapping(value = "/getPaises", method = { RequestMethod.POST })
	public ResponseEntity< List<?> > getPaises( ){
		List<?> data =  repoPais.getNombresPaises();
		
		return new ResponseEntity<>(data, HttpStatus.OK);
	}
	
	// #######################Funciones de prueba#######################
	
	//De prueba, se puede borrar
	@RequestMapping(value = "/mail/enviar", method = { RequestMethod.POST })
	public void enviarMail(@RequestBody com.amq.mail.Mensaje msj) {
		try {
			com.amq.mail.MailSender mailSender = new com.amq.mail.MailSender();
			mailSender.enviarMail(msj);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	//De prueba, se puede borrar
	@RequestMapping(value = "/notif", method = { RequestMethod.POST })
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
	private Boolean alojCumpleFiltro(Alojamiento a, DtFiltrosAlojamiento dtF) {
		if( dtF == null ) {
			return true;
		}
		if( a == null ) {
			return false;
		}
		if( dtF.getAloj_activo()!=null && a.getActivo()!=dtF.getAloj_activo() ) {
			return false;
		}
		if( dtF.getAloj_desc()!=null && !dtF.getAloj_desc().trim().equals("")) {
			if( !valuesInString( dtF.getAloj_desc().split(" "), a.getDescripcion()) ) {
				return false;
			}
		}
		if( dtF.getAloj_nombre()!=null && !dtF.getAloj_nombre().trim().equals("")) {
			if( !valuesInString( dtF.getAloj_nombre().split(" "), a.getNombre()) ) {
				return false;
			}
		}
		if( dtF.getId_anf()!=null && dtF.getId_anf() != a.getAnfitrion().getId()) {
			return false;
		}
		if( dtF.getAloj_ciudad()!=null && !dtF.getAloj_ciudad().trim().equals("") 
				&& !dtF.getAloj_ciudad().equals( a.getDireccion().getCiudad() ) ) {
			return false;
		}
		if( dtF.getAloj_idPais()!=null && dtF.getAloj_idPais()!=0 
				&& dtF.getAloj_idPais() !=  a.getDireccion().getPais().getId()  ) {
			return false;
		}
		return true;
	}
	private Boolean valuesInString( String[]vals, String v ) {
		for(int i=0; i<vals.length; i++) {
			if(! v.contains(vals[i]) ) {
				return false;
			}
		}
		return true;
	}
	private Boolean filtroAfectaHab(DtFiltrosAlojamiento filtro) {
		if( 
				( filtro.getHab_camas()!=null && filtro.getHab_camas()!=0 )  
				|| ( filtro.getHab_camas_mas_de()!=null && filtro.getHab_camas_mas_de() != 0 ) 
				|| ( filtro.getHab_desc()!=null && filtro.getHab_desc().trim()!= "")
				|| ( filtro.getHab_precio()!=null && filtro.getHab_precio()!=0 )
				|| ( filtro.isHab_serv_aire()!=null )
				|| ( filtro.isHab_serv_desayuno()!=null )
				|| ( filtro.isHab_serv_jacuzzi()!=null )
				|| ( filtro.isHab_serv_parking()!=null )
				|| ( filtro.isHab_serv_tvCable()!=null )
				|| ( filtro.isHab_serv_wifi()!=null )
		) {
			return true;
		}
		return false;
	}
	private Boolean habCumpleFiltro(Habitacion hab, DtFiltrosAlojamiento filtros) {
		if(filtros==null) {
			return true;
		}
		if(hab==null) {
			return false;
		}
		if( filtros.getHab_camas()!=null && filtros.getHab_camas()!=0 && hab.getCamas() != filtros.getHab_camas()) {
			return false;
		}
		if( filtros.getHab_camas_mas_de()!=null && filtros.getHab_camas_mas_de()!=0 && hab.getCamas() <= filtros.getHab_camas_mas_de()) {
			return false;
		}
		if( filtros.getHab_desc()!=null && !filtros.getHab_desc().trim().equals("") 
				&& !valuesInString(filtros.getHab_desc().split(""), hab.getDescripcion())) {
			return false;
		}
		if( filtros.getHab_precio()!=null && filtros.getHab_precio()!=0
				&& hab.getPrecioNoche() != filtros.getHab_precio() ) {
			return false;
		}
		if( filtros.getHab_precio_hasta()!=null && filtros.getHab_precio_hasta()!=0
				&& filtros.getHab_precio_hasta()<hab.getPrecioNoche() ) {
			return false;
		}
		
		if(filtros.isHab_serv_aire()!=null && !filtros.isHab_serv_aire()){ 
			return false;
		}
		if(filtros.isHab_serv_desayuno()!=null && ! filtros.isHab_serv_desayuno()){ 
			return false;
		}
		if(filtros.isHab_serv_jacuzzi() !=null&& ! filtros.isHab_serv_jacuzzi()){ 
			return false;
		}
		if(filtros.isHab_serv_parking()!=null && ! filtros.isHab_serv_parking()){ 
			return false;
		}
		if(filtros.isHab_serv_tvCable()!=null && ! filtros.isHab_serv_tvCable()){ 
			return false;
		}
		if(filtros.isHab_serv_wifi()!=null && ! filtros.isHab_serv_wifi()){ 
			return false;
		}
		return true;
	}
}
