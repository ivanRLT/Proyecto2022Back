package com.amq.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.validation.ReportAsSingleViolation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.amq.datatypes.DtAMQError;
import com.amq.datatypes.DtAlojHab;
import com.amq.datatypes.DtAlojamiento;
import com.amq.datatypes.DtAltaAlojHab;
import com.amq.datatypes.DtDireccion;
import com.amq.datatypes.DtFecha;
import com.amq.datatypes.DtFiltroResenas;
import com.amq.datatypes.DtFiltrosAlojamiento;
import com.amq.datatypes.DtHabitacion;
import com.amq.datatypes.DtIdValor;
import com.amq.datatypes.DtModificarAloj;
import com.amq.datatypes.DtProducto;
import com.amq.datatypes.DtResena;
import com.amq.datatypes.DtReserva;
import com.amq.datatypes.DtServicios;
import com.amq.datatypes.DtUsuario;
import com.amq.model.Alojamiento;
import com.amq.model.Anfitrion;
import com.amq.model.Habitacion;
import com.amq.model.Reserva;
import com.amq.model.Usuario;
import com.amq.notification.FirebaseNotificationAdmin;
import com.amq.repositories.RepositoryAlojamiento;
import com.amq.repositories.RepositoryCalificacion;
import com.amq.repositories.RepositoryDireccion;
import com.amq.repositories.RepositoryHabitacion;
import com.amq.repositories.RepositoryPais;
import com.amq.repositories.RepositoryReserva;
import com.amq.repositories.RepositoryServicios;
import com.amq.repositories.RepositoryUsuario;
import com.google.firebase.messaging.Notification;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/alojamiento")
public class ControladorAlojamiento {
	private static String HEADER_ERROR="AMQ_ERROR";
	String msjError=null;
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
	@Autowired
	RepositoryCalificacion repoCal;
	@Autowired
	RepositoryReserva repoRes;
	@Autowired
	RepositoryCalificacion repoC;
	
	// #######################Funciones de alojamiento#######################
	
	@RequestMapping(value = "/altaAlojHab", method = { RequestMethod.POST })
	@PreAuthorize("hasRole('ROLE_AN')")
	public ResponseEntity<?> altaAlojamientoHabitacion(@RequestBody DtAltaAlojHab dtAlojHab) {
		Alojamiento aloj;
		Habitacion hab;
		List<Habitacion> habs;
		
		try {
			//Obtiene Anfitrion
			Optional<Usuario>  optUsr= repoU.findById( dtAlojHab.getIdAnfitrion() );
			if( optUsr.isEmpty() || !( optUsr.get() instanceof Anfitrion )  ) {
				msjError = "No se encontraron usuarios con los datos ingresados.";
				return new ResponseEntity<>( new DtAMQError(0, msjError), getHeaderError(msjError), HttpStatus.NOT_FOUND);
			}
			Anfitrion anf = (Anfitrion) optUsr.get();
			repoSer.save(dtAlojHab.getHab_dtservicios());
			repoDir.save(dtAlojHab.getAloj_direcion());
			
			if( repoPais.findById(dtAlojHab.getAloj_direcion().getPais().getId() ).isEmpty() )
			{
				msjError = "No existe un pais con los datos ingresados..";
				return new ResponseEntity<>( new DtAMQError(0, msjError), getHeaderError(msjError), HttpStatus.NOT_FOUND);
			}
			
			hab = new Habitacion( 
					0, //id
					dtAlojHab.getHab_descripcion(),
					dtAlojHab.getHab_precioNoche(),
					dtAlojHab.getHab_camas(),
					dtAlojHab.getHab_dtservicios(),
					null //alojamiento
				);
			habs = new ArrayList<Habitacion>();
			habs.add(hab);
			
			aloj = new Alojamiento(
					0, //id
					true, //activo
					dtAlojHab.getAloj_descripcion(),
					dtAlojHab.getAloj_nombre(),
					dtAlojHab.getAloj_direcion(),
					habs,
					anf
				);
			hab.setAlojamiento(aloj);
			
			repoA.save(aloj);
			
			return new ResponseEntity<>(aloj, HttpStatus.OK);
		}
		catch(Exception e) {
			msjError = "Error desconocido en el servidor";
			return new ResponseEntity<>(new DtAMQError(0, msjError), getHeaderError(msjError),  HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@RequestMapping(value = "/alta/{id}", method = { RequestMethod.POST })
	public ResponseEntity<?> altaAlojamiento(@RequestBody DtAlojamiento alojDT, @PathVariable("id") int idAnf) {
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
					msjError = "El usuario ingresado no es de tipo Anfitrión.";
					return new ResponseEntity<>( new DtAMQError(0, msjError), getHeaderError(msjError), HttpStatus.NOT_ACCEPTABLE);
				}
			} else {
				msjError = "No existe un Anfitrión con los datos ingresados.";
				return new ResponseEntity<>( new DtAMQError(0, msjError), getHeaderError(msjError), HttpStatus.NOT_FOUND);
			}
		} catch (Exception e) {
			msjError = "Error desconocido en el servidor";
			return new ResponseEntity<>(new DtAMQError(0, msjError), getHeaderError(msjError),  HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@RequestMapping(value = "/agregarHabitaciones/{id}", method = { RequestMethod.POST })
	@PreAuthorize("hasRole('ROLE_AN')")
	public ResponseEntity<?> agregarHabitacionesAlojamiento(@PathVariable("id") int idAlo, @RequestBody DtHabitacion habitacion) {
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
				
				return new ResponseEntity<>(habR, HttpStatus.OK);
			} else {
				msjError = "No existe un alojamiento con los datos ingresados.";
				return new ResponseEntity<>( new DtAMQError(0, msjError), getHeaderError(msjError), HttpStatus.NOT_FOUND);
			}
		} catch (Exception e) {
			msjError = "Error desconocido en el servidor";
			return new ResponseEntity<>(new DtAMQError(0, msjError), getHeaderError(msjError),  HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@RequestMapping(value = "/modificar", method = { RequestMethod.POST })
	@PreAuthorize("hasRole('ROLE_AN')")
	public ResponseEntity<?> modificarAlojamiento(@RequestBody DtModificarAloj dtAloj) {
		try {
			Optional<Alojamiento> opA = repoA.findById(dtAloj.getId());
			if (opA.isPresent()) {
				Alojamiento alojamiento = opA.get();
				if(dtAloj.getDescripcion()!=null){
					alojamiento.setDescripcion( dtAloj.getDescripcion() );
				}
				if(dtAloj.getNombre()!=null) {
					alojamiento.setNombre(dtAloj.getNombre() );
				}
				if( dtAloj.getDireccion() != null && dtAloj.getDireccion().getCalle()!=null ) {
					alojamiento.getDireccion().setCalle( dtAloj.getDireccion().getCalle() );
				}
				
				if( dtAloj.getDireccion() != null && dtAloj.getDireccion().getNumero()!=null ) {
					alojamiento.getDireccion().setNumero( dtAloj.getDireccion().getNumero() );
				}
				
				if( dtAloj.getDireccion() != null && dtAloj.getDireccion().getCiudad()!=null ) {
					alojamiento.getDireccion().setCiudad( dtAloj.getDireccion().getCiudad() );
				}
				
				repoA.save(alojamiento);
				return new ResponseEntity<>( HttpStatus.OK);
			} else {
				msjError = "No existe un alojamiento con los datos ingresados.";
				return new ResponseEntity<>( new DtAMQError(0, msjError), getHeaderError(msjError), HttpStatus.NOT_FOUND);
			}
		} catch (Exception e) {
			msjError = "Error desconocido en el servidor";
			return new ResponseEntity<>(new DtAMQError(0, msjError), getHeaderError(msjError),  HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@RequestMapping(value = "/buscarAlojamiento/{id}", method = { RequestMethod.GET })
	@PreAuthorize("hasRole('ROLE_AN')")
	public ResponseEntity<?> buscarAlojamiento(@PathVariable("id") int id) {
		
		try {
			Optional<Alojamiento> optAloj = repoA.findById(id);
			if( optAloj.isEmpty() ) {
				msjError = "No existe un alojamiento con los datos ingresados.";
				return new ResponseEntity<>( new DtAMQError(0, msjError), getHeaderError(msjError), HttpStatus.NOT_FOUND);
			}
			
			Alojamiento a = (Alojamiento)optAloj.get();
			DtAlojamiento dtAloj = new DtAlojamiento(
							a.getId(),
							a.getActivo(), 
							a.getDescripcion(), 
							a.getDireccion(), 
							a.getNombre(),
							null
						);
			List<DtHabitacion> dtHabs = new ArrayList<DtHabitacion>();
			DtHabitacion dtHab;
			for(Habitacion hab : a.getHabitaciones()) {
				dtHab = new DtHabitacion(
						hab.getId(),
						hab.getDescripcion(), 
						hab.getPrecioNoche(), 
						hab.getCamas(), 
						hab.getServicios()
					);
				dtHabs.add(dtHab);
			}
			dtAloj.setHabs(dtHabs);
			return new ResponseEntity<>(dtAloj, HttpStatus.OK);
		} catch (Exception e) {
			msjError = "Error desconocido en el servidor";
			return new ResponseEntity<>(new DtAMQError(0, msjError), getHeaderError(msjError),  HttpStatus.INTERNAL_SERVER_ERROR);
		}	
		//return dtAlojamiento
	}
	
	@RequestMapping(value = "/buscarAlojamientoHab/{id}", method = { RequestMethod.GET })
	public ResponseEntity<?> buscarAlojamientoHab(@PathVariable("id") int idHab) {
		
		try {
			DtAlojHab dtAlojHab = repoA.buscarAlojHab(idHab);
			if( dtAlojHab == null ) {
				msjError = "No existe un alojamiento con los datos ingresados.";
				return new ResponseEntity<>( new DtAMQError(0, msjError), getHeaderError(msjError), HttpStatus.NOT_FOUND);
			}
			
			return new ResponseEntity<>(dtAlojHab, HttpStatus.OK);
		} catch (Exception e) {
			msjError = "Error desconocido en el servidor";
			return new ResponseEntity<>(new DtAMQError(0, msjError), getHeaderError(msjError),  HttpStatus.INTERNAL_SERVER_ERROR);
		}	
	}
	
	@RequestMapping(value = "/desactivarAlojamiento/{id}", method = { RequestMethod.POST })
	@PreAuthorize("hasRole('ROLE_AN')")
	public ResponseEntity<?> desactivarAlojamiento(@PathVariable("id") int idAlo ) {

		Alojamiento a;
		try {
			Optional<Alojamiento> optA = repoA.findById(idAlo);
			if(!optA.isPresent()) {
				msjError = "No existe un alojamiento con los datos ingresados.";
				return new ResponseEntity<>( new DtAMQError(0, msjError), getHeaderError(msjError), HttpStatus.NOT_FOUND);
			}
			a = optA.get();
			a.setActivo(false);
			repoA.save(a);
			return new ResponseEntity<>(HttpStatus.OK);
		} catch (Exception e) {
			msjError = "Error desconocido en el servidor";
			return new ResponseEntity<>(new DtAMQError(0, msjError), getHeaderError(msjError),  HttpStatus.INTERNAL_SERVER_ERROR);
		}	

	}
	


	@RequestMapping(value = "/listarAlojamientos", method = { RequestMethod.POST })
	public ResponseEntity< ? > listarAlojamientos(@RequestBody DtFiltrosAlojamiento filtros) {

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
							a.getNombre(),
							null
						);
					for( Habitacion hab : a.getHabitaciones() ) {
						//Si no desea aplicar filtro de habitaciones o desea aplicar filtros y estos se cumplen
						if( !filtrarHabitaciones || habCumpleFiltro(hab, filtros) ) {
							dtHab = new DtHabitacion(
									hab.getId(),
									hab.getDescripcion(), 
									hab.getPrecioNoche(), 
									hab.getCamas(), 
									hab.getServicios());
							dtHabs.add(dtHab);
						}
					}
					if( !filtrarHabitaciones || dtHabs.size()>0) {
						dtA.setHabs(dtHabs);
						dtAlojs.add(dtA);
					}
				}
			}
			if (dtAlojs.isEmpty()) {
				msjError = "No se encontraron alojamientos.";
				return new ResponseEntity<>( new DtAMQError(0, msjError), getHeaderError(msjError), HttpStatus.NOT_FOUND);
			} else {
				return new ResponseEntity<>(dtAlojs, HttpStatus.OK);
			}
		} catch (Exception e) {
			msjError = "Error desconocido en el servidor";
			return new ResponseEntity<>(new DtAMQError(0, msjError), getHeaderError(msjError),  HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	
	


	
	@RequestMapping(value = "/reservasAlojamiento/{id}", method = { RequestMethod.GET })
	@PreAuthorize("hasRole('ROLE_AN')")
	public ResponseEntity<?> obtenerReservasAlojamiento(@PathVariable("id") int id ) {
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
					msjError = "No se encontraron reservas.";
					return new ResponseEntity<>( new DtAMQError(0, msjError), getHeaderError(msjError), HttpStatus.NOT_FOUND);
				}else {
					return new ResponseEntity<>(reservasDT, HttpStatus.OK);
				}
			}else {
				msjError = "No se encontraró un alojamiento con los datos ingresados.";
				return new ResponseEntity<>( new DtAMQError(0, msjError), getHeaderError(msjError), HttpStatus.NOT_FOUND);
			}
		} catch (Exception e) {
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}

	}
	@RequestMapping(value = "/getPaises", method = { RequestMethod.GET })
	public ResponseEntity< List<DtIdValor> > getPaises( ){
		List<DtIdValor> data =  repoPais.getNombresPaises();
		
		return new ResponseEntity<>(data, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/getPaisesEnAlojamiento", method = { RequestMethod.GET })
	public ResponseEntity< List<DtIdValor> > getPaisesEnAlojamiento( ){
		List<DtIdValor> data =  repoPais.getPaisesEnAlojamiento();
		
		return new ResponseEntity<>(data, HttpStatus.OK);
	}
	
	
	//##########################################################################//
	//########################## FUNCIONES AUXILIARES ##########################//
	//##########################################################################//

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
				( filtro.getHab_camas()!=null && !filtro.getHab_camas().equals(0) )  
				|| ( filtro.getHab_camas_mas_de()!=null && !filtro.getHab_camas_mas_de().equals(0)) 
				|| ( filtro.getHab_desc()!=null && !filtro.getHab_desc().trim().equals( "") )
				|| ( filtro.getHab_precio()!=null )
				|| ( filtro.getHab_precio_hasta()!=null && !filtro.getHab_precio_hasta().equals(0.0) )
				|| ( filtro.isHab_serv_aire()!=null )
				|| ( filtro.isHab_serv_desayuno()!=null )
				|| ( filtro.isHab_serv_jacuzzi()!=null )
				|| ( filtro.isHab_serv_parking()!=null )
				|| ( filtro.isHab_serv_tvCable()!=null )
				|| ( filtro.isHab_serv_wifi()!=null )
				|| ( filtro.getIdHuespedConReserva()!=null )
				|| ( filtro.getIdHuespedSeQuedoEnAloj()!=null )
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
				&& hab.getPrecioNoche().compareTo( filtros.getHab_precio() ) < 0  ) {
			return false;
		}
		if( filtros.getHab_precio_hasta()!=null && filtros.getHab_precio_hasta()!=0
				&& filtros.getHab_precio_hasta().compareTo( hab.getPrecioNoche() ) < 0 ) {
			return false;
		}
		
		if(filtros.isHab_serv_aire()!=null && filtros.isHab_serv_aire() != hab.getServicios().isAire() ){ 
			return false;
		}
		if(filtros.isHab_serv_desayuno()!=null && filtros.isHab_serv_desayuno() != hab.getServicios().isDesayuno()){ 
			return false;
		}
		if(filtros.isHab_serv_jacuzzi() !=null&& filtros.isHab_serv_jacuzzi() != hab.getServicios().isJacuzzi()){ 
			return false;
		}
		if(filtros.isHab_serv_parking()!=null && filtros.isHab_serv_parking() != hab.getServicios().isParking() ){ 
			return false;
		}
		if(filtros.isHab_serv_tvCable()!=null && filtros.isHab_serv_tvCable() != hab.getServicios().isTvCable()){ 
			return false;
		}
		if(filtros.isHab_serv_wifi()!=null && filtros.isHab_serv_wifi() != hab.getServicios().isWifi()){ 
			return false;
		}
		if(filtros.getIdHuespedConReserva()!=null && !usrTieneReservaEnAlojamiento( hab.getId(), filtros.getIdHuespedConReserva() ) ) {
			return false;
		}
		
		if(filtros.getIdHuespedSeQuedoEnAloj()!=null && !usrSeQuedoEnAlojamiento( hab.getId(), filtros.getIdHuespedSeQuedoEnAloj() ) ) {
			return false;
		}
		return true;
	}
	
	private boolean usrTieneReservaEnAlojamiento( int idAloj, int idUsr) {
		
		List<DtIdValor> dtIdVal = repoRes.usrTieneReservaEnAlojamiento( idAloj, idUsr);
		
		return dtIdVal.size()>0;
		
	}
	
	private boolean usrSeQuedoEnAlojamiento( int idAloj, int idUsr) {

		
		List<DtIdValor> dtIdVal = repoRes.usrSeQuedoEnAlojamiento( idAloj, idUsr);
		
		return dtIdVal.size()>0;
	}
	
	private Date dtFecha2Date(DtFecha dtF){
		try {
			String sFecha =  
					((Integer)dtF.getDia()).toString()+"/"+
					((Integer)dtF.getMes()).toString()+"/"+
					((Integer)dtF.getAnio()).toString();
			return new SimpleDateFormat("dd/MM/yyyy").parse(sFecha);  
		}
		catch(Exception d ) {
			return null;
		}
		
	}
	private String dtFecha2DbString( DtFecha f) {
		String mes = String.valueOf( f.getMes() );
		mes = mes.length()==1 ? "0"+mes : mes;
		
		String dia = String.valueOf( f.getDia() );
		dia = dia.length()==1 ? "0"+dia : dia;
		
		String strFecha = 
				String.valueOf( f.getAnio() ) +"-"+
				mes+"-"+ dia ;
		return  strFecha;
	}
	
    private HttpHeaders getHeaderError( String error ) {
		HttpHeaders responseHeaders = new HttpHeaders();
	   responseHeaders.set(HEADER_ERROR, error);
	   return responseHeaders;
	}
    
	public void enviarMail(@RequestBody com.amq.mail.Mensaje msj) {
		try {
			com.amq.mail.MailSender mailSender = new com.amq.mail.MailSender();
			mailSender.enviarMail(msj);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	@RequestMapping(value = "/sendPush/{token}", method = { RequestMethod.GET })
	public void enviarNotificacion( @PathVariable("token") String token ) {
		try {
			com.amq.notification.FirebaseNotificationAdmin notAdmin = FirebaseNotificationAdmin.getInstancia();
			com.google.firebase.messaging.Notification not  = Notification.builder()
					.setTitle("titulo notif")
					.setBody("body notif")
					.build();
			List<String> tokens = new ArrayList<String>();
			tokens.add(token);
			notAdmin.sendNotification(not, tokens);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
