package com.amq.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.amq.datatypes.DtAltaReserva;
import com.amq.datatypes.DtCalificacion;
import com.amq.datatypes.DtEnviarCalificacion;
import com.amq.datatypes.DtFactura;
import com.amq.datatypes.DtFecha;
import com.amq.datatypes.DtReserva;
import com.amq.enums.PagoEstado;
import com.amq.enums.ReservaEstado;
import com.amq.model.Alojamiento;
import com.amq.model.Anfitrion;
import com.amq.model.Calificacion;
import com.amq.model.Factura;
import com.amq.model.Habitacion;
import com.amq.model.Huesped;
import com.amq.model.Reserva;
import com.amq.model.Usuario;
import com.amq.repositories.RepositoryCalificacion;
import com.amq.repositories.RepositoryFactura;
import com.amq.repositories.RepositoryHabitacion;
import com.amq.repositories.RepositoryReserva;
import com.amq.repositories.RepositoryUsuario;
import com.amq.service.IUsuarioService;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/reserva")
public class ControladorReserva {
	
	@Autowired
	RepositoryUsuario repoU;
	
	@Autowired
	RepositoryReserva repoR;
	
	@Autowired
	RepositoryHabitacion repoH;
	
	@Autowired
	RepositoryFactura repoF;
	
	@Autowired
	RepositoryCalificacion repoC;
	
	@Autowired
    private JavaMailSender mailSender;
	
	@Autowired
	private IUsuarioService userService;
	
	 @Autowired
	 private MessageSource messages;
	
/*	 @RequestMapping(value = "/cancelarReservaConfirmada/{idreserva}", method = { RequestMethod.POST })	
		public ResponseEntity<Factura> cancelarReserva(@PathVariable("idreserva") int idreserva, @RequestBody DtFactura facturadt){
			try {
				Optional<Reserva> resOp = repoR.findById(idreserva);
				if ( !resOp.isPresent()) {
					return new ResponseEntity<>(;
				}
				
				//*** Evaluar otros estados ***
				if( resOp.get().getEstado()!=ReservaEstado.APROBADO ){
					return new ResponseEntity<>(HttpStatus.PRECONDITION_FAILED);
				}
				
				
				
				Reserva reservaC = resOP.get();
				Habitacion habitacion = reservaC.getHabitacion();
				List<Reserva> reservasH = habitacion.getReservas();
				Boolean solapamiento = false;
				for (Reserva r : reservasH) {
					DtFecha reservasRI = r.getDtFechaInicio();
					DtFecha reservasRF = r.getDtFechaFin();
					DtFecha reservaI = reservaC.getDtFechaInicio();
					DtFecha reservaF = reservaC.getDtFechaFin();
					if (reservaI.getAnio() < reservasRF.getAnio() && reservaI.getAnio() > reservasRI.getAnio()) {
						if (reservaI.getMes() < reservasRF.getMes() && reservaI.getMes() > reservasRI.getMes()) {
							if (reservaI.getDia() < reservasRF.getDia() && reservaI.getDia() > reservasRI.getDia()) {
								solapamiento = true;
							}
						}
					}
					if (reservaF.getAnio() < reservasRF.getAnio() && reservaF.getAnio() > reservasRI.getAnio()) {
						if (reservaF.getMes() < reservasRF.getMes() && reservaF.getMes() > reservasRI.getMes()) {
							if (reservaF.getDia() < reservasRF.getDia() && reservaF.getDia() > reservasRI.getDia()) {
								solapamiento = true;
							}
						}
					}
					if (reservaI.getAnio() < reservasRI.getAnio() && reservaF.getAnio() > reservasRF.getAnio()) {
						if (reservaI.getMes() < reservasRI.getMes() && reservaF.getMes() > reservasRF.getMes()) {
							if (reservaI.getDia() < reservasRI.getDia() && reservaF.getDia() > reservasRF.getDia()) {
								solapamiento = true;
							}
						}
					}
				}
				if (!solapamiento) {
					reservaC.setEstado(ReservaEstado.APROBADO);
					List<Factura> facturas = reservaC.getFacturas();
					Factura factura = null;
					for (Factura f : facturas) {
						if(f.getEstado() == PagoEstado.PENDIENTE) {
							factura = f;
						}
					}
					return new ResponseEntity<>(factura, HttpStatus.OK);
				}else {
					return new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
				}
			} catch (Exception e) {
				return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
			}
		}
*/	 
	@RequestMapping(value = "/confirmar/{idreserva}", method = { RequestMethod.POST })	
	public ResponseEntity<Factura> confirmarReserva(@PathVariable("idreserva") int idreserva, @RequestBody DtFactura facturadt){
		try {
			Optional<Reserva> resOP = repoR.findById(idreserva);
			if (resOP.isPresent()) {
				Reserva reservaC = resOP.get();
				
				if( reservaC.getEstado()!=ReservaEstado.PENDIENTE ) {
					return new ResponseEntity<>(null, HttpStatus.NOT_ACCEPTABLE);
				}
				
				Habitacion habitacion = reservaC.getHabitacion();
				List<Reserva> habitaciones = habitacion.getReservas();
				DtFecha dtFIniResPend = reservaC.getDtFechaInicio();
				DtFecha dtFFinResPend = reservaC.getDtFechaFin();
				
				Date fIniResPend = reservaC.getFechaInicio();

				Date fFinResPend = reservaC.getFechaFin();
				
				if( fIniResPend==null ) {
					return new ResponseEntity<>(HttpStatus.NOT_ACCEPTABLE);
				}
				if( fFinResPend==null ) {
					return new ResponseEntity<>(HttpStatus.NOT_ACCEPTABLE);
				}
				
				Boolean solapamiento;
				for (Reserva r : habitaciones) {
					
					if( r.getEstado()==ReservaEstado.APROBADO || r.getEstado()==ReservaEstado.EJECUTADA  ){
						Date fIniResConfirm =  r.getFechaInicio();
						Date fFinResConfirm =  r.getFechaFin();
						
						//Si es null la fecha es inváilda
						if(fIniResConfirm == null || fFinResConfirm==null ) {
							return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
						}
						if( fechaMayorAFecha(fIniResConfirm, fFinResConfirm) ) {
							return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
						}
						
						solapamiento=true;
		
						if( fechaMayorAFecha(fIniResPend, fFinResConfirm) ) {
							solapamiento=false;
						}
						else if( fechaMenorAFecha(fFinResPend, fIniResConfirm) ) {
							solapamiento=false;
						}
						
						if(solapamiento) {
							return new ResponseEntity<>( HttpStatus.BAD_REQUEST );
						}
					}
				}
				reservaC.setEstado(ReservaEstado.APROBADO);
				List<Factura> facturas = reservaC.getFacturas();
				Factura factura = new Factura(
						-1, 
						facturadt.getMonto()!=null ? facturadt.getMonto() : 0, 
						facturadt.getMontoDescuento()!=null ? true : false, 
						facturadt.getMontoDescuento()!=null ? facturadt.getMontoDescuento() : 0, 
						facturadt.getPagoEstado(), 
						facturadt.getFecha(),
						reservaC
					);
				
				
				reservaC.getFacturas().add(factura);
				
				repoR.save(reservaC);
				return new ResponseEntity<>(factura, HttpStatus.OK);
			} else {
				return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
			}	
		} catch (Exception e) {
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@RequestMapping(value = "/confirmarPagoRealizado/{idfactura}", method = { RequestMethod.POST })	
	public ResponseEntity<Factura> confirmarPagoRealizado(@PathVariable("idfactura") int idfactura){
		try {
			Optional<Factura> facturaOP = repoF.findById(idfactura);
			if (facturaOP.isPresent()) {
				Factura factura = facturaOP.get();
				factura.setEstado(PagoEstado.REALIZADO);
				
				return new ResponseEntity<>(factura, HttpStatus.OK);
			}else {
				return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
			}
		} catch (Exception e) {
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@RequestMapping(value = "/calificar", method = { RequestMethod.POST })
    public ResponseEntity<String> calificar(@RequestBody DtEnviarCalificacion dtEnvCal) {
		
		Calificacion cal;
		
		try {
			Optional<Reserva> optRes = repoR.findById(dtEnvCal.getIdReserva());
			
			if (optRes.get().getEstado()==ReservaEstado.PENDIENTE || optRes.get().getEstado()== ReservaEstado.RECHAZADO){
				return new ResponseEntity<>(HttpStatus.NOT_ACCEPTABLE);				
			}
			
			if( dtEnvCal.getCalificacion()==null && dtEnvCal.getResena()==null) {			
				return new ResponseEntity<>(HttpStatus.NOT_ACCEPTABLE);
			}
		
    		Optional<Usuario> optUsr = repoU.findById(dtEnvCal.getIdUsuario());
    		
    		if( optRes.get().getCalificacion()==null) {
    			cal = new Calificacion( 0 ,0, 0 , "", new DtFecha(0, 0, 0));
    			repoC.save(cal);
    			optRes.get().setCalificacion( cal );
    		}
    		else {
    			cal = optRes.get().getCalificacion();
    		}
    		
    		//Setea la reseña
    		if( !optUsr.isPresent() ) {
    			if( dtEnvCal.getResena()!=null ) {
    				cal.setResena(dtEnvCal.getResena());
    				LocalDate hoy = LocalDate.now();
					DtFecha dtFecha = new DtFecha( hoy.getDayOfMonth() , hoy.getMonthValue()-1, hoy.getYear());
    				cal.setFechaResena(dtFecha);
    			}
    		}
    		else if(optUsr.get() instanceof Huesped) {
    			cal.setCalificacionHuesped(dtEnvCal.getCalificacion());
    		}
    		else if(optUsr.get() instanceof Anfitrion) {
    			if(dtEnvCal.getCalificacion()!=null) {
    				cal.setCalificacionAnfitrion(dtEnvCal.getCalificacion());
    			}
    		}
    		
    		repoC.save(cal);
    		repoU.save(optUsr.get());
    		recalcularCalificacionGlobal(dtEnvCal.getIdUsuario());
    		return new ResponseEntity<>(HttpStatus.OK);
    	}
    	catch(Exception e) {
    		return new ResponseEntity<>(e.getMessage(),HttpStatus.INTERNAL_SERVER_ERROR);
    	}
    }
	
	@RequestMapping(value = "/realizarReserva", method = { RequestMethod.POST })
	public ResponseEntity<Reserva> realizarReserva(@RequestBody DtAltaReserva dtAltaRes) {
		
		try {
			Optional<Usuario> huOpt = repoU.findById(dtAltaRes.getIdHu());
			if (!huOpt.isPresent()) {
				return new ResponseEntity<>( HttpStatus.NOT_FOUND);
			}

			Optional<Habitacion> habOpt = repoH.findById(dtAltaRes.getIdHab());
			if (!habOpt.isPresent()) {
				return new ResponseEntity<>(HttpStatus.NOT_FOUND);
			}
			if ( !(huOpt.get() instanceof Huesped) ) {
				return new ResponseEntity<>(HttpStatus.NOT_ACCEPTABLE);
			}
			
			Date fIniSolicitudRes = dtFecha2Date(dtAltaRes.getFInicio());

			Date fFinSolicitudRes = dtFecha2Date(dtAltaRes.getFFin());
			
			if( fIniSolicitudRes==null ) {
				return new ResponseEntity<>(HttpStatus.NOT_ACCEPTABLE);
			}
			if( fFinSolicitudRes==null ) {
				return new ResponseEntity<>(HttpStatus.NOT_ACCEPTABLE);
			}
			//Fecha de fin menor a la fecha de inicio
			if( fFinSolicitudRes.compareTo(fIniSolicitudRes)<0 ) {
				return new ResponseEntity<>(HttpStatus.NOT_ACCEPTABLE);
			}
			
			Boolean solapamiento = false;
			Habitacion hab = habOpt.get();
			List<Reserva> reservas = hab.getReservas();
			
			//Evalua fechas de las reservas aprobadas o ejecutadas
			for (Reserva r : reservas) {
				if( r.getEstado()==ReservaEstado.APROBADO || r.getEstado()==ReservaEstado.EJECUTADA  ){
					Date fIniResConfirm =  r.getFechaInicio();
					Date fFinResConfirm =  r.getFechaFin();
					
					//Si es null la fecha es inváilda
					if(fIniResConfirm == null || fFinResConfirm==null ) {
						return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
					}
					if( fechaMayorAFecha(fIniResConfirm, fFinResConfirm) ) {
						return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
					}
					
					solapamiento=true;
	
					if( fechaMayorAFecha(fIniSolicitudRes, fFinResConfirm) ) {
						solapamiento=false;
					}
					else if( fechaMenorAFecha(fFinSolicitudRes, fIniResConfirm) ) {
						solapamiento=false;
					}
					
					if(solapamiento) {
						return new ResponseEntity<>( HttpStatus.BAD_REQUEST );
					}
				}
			}
			Huesped huesped = (Huesped) huOpt.get();						
			Reserva reserva = new Reserva();
			reserva.setCalificacion(null);
			reserva.setCantDias(dtAltaRes.getCantDias());
			reserva.setEstado(ReservaEstado.PENDIENTE);
			reserva.setFechaInicio(fIniSolicitudRes);
			reserva.setFechaFin(fFinSolicitudRes);
			reserva.setIdChat(null);
			reserva.setHuesped(huesped);
			reserva.setHabitacion(hab);
			hab.agregarReserva(reserva);
			huesped.addReserva(reserva);
			Factura factura = new Factura();
			double monto = hab.getPrecioNoche() * reserva.getCantDias();					
			if (dtAltaRes.getDescuento() != 0) {
				factura.setDescuento(true);
				factura.setMontoDescuento(dtAltaRes.getDescuento());
				factura.setMonto(monto - dtAltaRes.getDescuento());
			}else {
				factura.setMonto(monto);
			}
			factura.setEstado(PagoEstado.PENDIENTE);
			factura.setReserva(reserva);
			LocalDate fecha = LocalDate.now();
			DtFecha fechadt = new DtFecha(fecha.getYear(), fecha.getMonthValue(), fecha.getDayOfMonth());
			factura.setFecha(fechadt);
			factura.setIdPaypal(dtAltaRes.getIdPaypal());
			repoF.save(factura);
			reserva.agregarFactura(factura);
			Reserva rRet = repoR.save(reserva);
			repoU.save(huesped);
			repoH.save(hab);
			

			return new ResponseEntity<>(reserva, HttpStatus.OK);
					
		} catch (Exception e) {
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	public boolean modificarReserva() {
		Boolean retorno = false;
		try {

		} catch (Exception e) {
			// TODO: handle exception
		}	
		return retorno;
	}
	public void buscarReserva(int id) {
		try {

		} catch (Exception e) {
			// TODO: handle exception
		}
		//retono Dt
	}
	public List<DtReserva> obtenerDtReservas(List<Reserva> rs) {
		List<DtReserva> retorno = new ArrayList<DtReserva>();
		for(Reserva r:rs) {
			List<DtFactura> facturasdt = new ArrayList<DtFactura>();
			List<Factura> facturas = r.getFacturas();
			for(Factura f:facturas) {
				DtFactura fac = new DtFactura(f.getEstado(), f.getMonto(), f.getFecha(), f.getDescuento(), f.getMontoDescuento());
				facturasdt.add(fac);
			}
			Calificacion calif = r.getCalificacion();
			DtCalificacion califdt = new DtCalificacion(calif.getCalificacionAnfitrion(), calif.getCalificacionHuesped(), calif.getResena(), calif.getFechaResena());
			DtReserva reservadt = new DtReserva(r.getEstado(),r.getDtFechaInicio(),r.getDtFechaFin(),r.getIdChat(),r.getCantDias(), facturasdt, califdt);
			retorno.add(reservadt);
		}
		return retorno;
	}


	// #######################Funciones de Facturas#######################
		public boolean altaFactura() {
			Boolean retorno = false;
			try {

			} catch (Exception e) {
				// TODO: handle exception
			}
			return retorno;
		}
		public boolean modificarFactura(int idReserva, int idFactura) {
			Boolean retorno = false;
			try {

			} catch (Exception e) {
				// TODO: handle exception
			}
			return retorno;
		}
		public DtFactura buscarFactura(int idReserva, int idFactura) {
			try {

			} catch (Exception e) {
				// TODO: handle exception
			}
			return null;
		}
		public List<DtFactura> listarFacturas(int idReserva) {
			try {

			} catch (Exception e) {
				// TODO: handle exception
			}
			return null;
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
		
		private Boolean fechaMenorAFecha(Date f1, Date f2){
			return f1.compareTo(f2) < 0;
		}
		
		private Boolean fechaMayorAFecha(Date f1, Date f2){
			return f1.compareTo(f2) > 0;
		}
		
		private void recalcularCalificacionGlobal(int id) throws Exception{
	    	int calificacionGlobal=0;
	    	Optional<Usuario> optUsr = repoU.findById(id);
	    	Usuario usr = optUsr.get();
	    	if(usr instanceof Anfitrion ) {
	    		Anfitrion anf = (Anfitrion) usr;
	    		List<Alojamiento> alojs= anf.getAlojamientos();
	    		for(Alojamiento a : alojs) {
	    			List<Habitacion> habs = a.getHabitaciones();
	    			for(Habitacion hab : habs) {
	    				List<Reserva> ress = hab.getReservas();
	    				for(Reserva res : ress) {
	    					if( res.getCalificacion()!=null ) {
	    						calificacionGlobal += res.getCalificacion().getCalificacionAnfitrion();
	    					}
	    				}
	    			}
	    		}
	    		anf.setCalificacionGlobal(calificacionGlobal);
	    	}
	    	if(usr instanceof Huesped) {
	    		Huesped hu = (Huesped) usr;
				List<Reserva> ress = hu.getReservas();
				for(Reserva res : ress) {
					if( res.getCalificacion()!=null ) {
						calificacionGlobal += res.getCalificacion().getCalificacionHuesped();
					}
				}
				hu.setCalificacionGlobal(calificacionGlobal);
	    	}
	    	repoU.save(usr);
	    }
}
