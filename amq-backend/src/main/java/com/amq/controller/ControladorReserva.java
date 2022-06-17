package com.amq.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpHeaders;
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
import com.amq.datatypes.DtAnioMes;
import com.amq.datatypes.DtCalificacion;
import com.amq.datatypes.DtCalificarDatosRequeridos;
import com.amq.datatypes.DtCalificarDatosRequeridosInput;
import com.amq.datatypes.DtDireccion;
import com.amq.datatypes.DtEnviarCalificacion;
import com.amq.datatypes.DtFactura;
import com.amq.datatypes.DtFecha;
import com.amq.datatypes.DtFiltroResenas;
import com.amq.datatypes.DtFiltrosEstadisticas;
import com.amq.datatypes.DtResHuespEstado;
import com.amq.datatypes.DtResena;
import com.amq.datatypes.DtReserva;
import com.amq.datatypes.DtReservaAlojHab;
import com.amq.datatypes.DtReservaAlojamiento;
import com.amq.datatypes.DtServicios;
import com.amq.datatypes.DtXY;
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
import com.amq.passwordReset.IUsuarioService;
import com.amq.repositories.RepositoryAlojamiento;
import com.amq.repositories.RepositoryCalificacion;
import com.amq.repositories.RepositoryFactura;
import com.amq.repositories.RepositoryHabitacion;
import com.amq.repositories.RepositoryReserva;
import com.amq.repositories.RepositoryUsuario;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/reserva")
public class ControladorReserva {
	private static String HEADER_ERROR="AMQ_ERROR"; 
	
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
	RepositoryAlojamiento repoA;
	
	@Autowired
    private JavaMailSender mailSender;
	@Autowired
	private IUsuarioService userService;
	
	@Autowired
	private MessageSource messages;
	
	@RequestMapping(value = "/cancelarReservaAprobada/{idreserva}", method = { RequestMethod.POST })	
	public ResponseEntity<Factura> cancelarReservaAprobada(@PathVariable("idreserva") int idreserva, @RequestBody DtFactura facturadt){
		try {
				Optional<Reserva> resOP = repoR.findById(idreserva);
				if (resOP.isPresent()) {
					Reserva resAprob = resOP.get();
					
					if( resAprob.getEstado()!=ReservaEstado.APROBADO ) {
						return new ResponseEntity<>(null, HttpStatus.NOT_ACCEPTABLE);
					}
					
					Habitacion habitacion = resAprob.getHabitacion();
					List<Reserva> reservas = habitacion.getReservas();
					
					Date fIniResPend = resAprob.getFechaInicio();

					Date fFinResPend = resAprob.getFechaFin();
					
					//?? aplicar descuento si corresponde
					
					if( fIniResPend==null ) {
						return new ResponseEntity<>(HttpStatus.NOT_ACCEPTABLE);
					}
					if( fFinResPend==null ) {
						return new ResponseEntity<>(HttpStatus.NOT_ACCEPTABLE);
					}
					

					resAprob.setEstado(ReservaEstado.RECHAZADO);
					List<Factura> facturas = resAprob.getFacturas();
					Factura factura = new Factura(
							-1, 
							facturadt.getMonto()!=null ? facturadt.getMonto() : 0, 
							facturadt.getMontoDescuento()!=null ? true : false, 
							facturadt.getMontoDescuento()!=null ? facturadt.getMontoDescuento() : 0, 
							facturadt.getPagoEstado(), 
							facturadt.getFecha(),
							resAprob
						);
					
					
					resAprob.getFacturas().add(factura);
					
					repoR.save(resAprob);
					return new ResponseEntity<>(factura, HttpStatus.OK);
				} else {
					return new ResponseEntity<>(HttpStatus.NOT_FOUND);
				}	
			} catch (Exception e) {
				return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
		}
	@RequestMapping(value = "/cancelarReservaPendiente/{idreserva}", method = { RequestMethod.GET })	
	public ResponseEntity<String> cancelarReservaPendiente(@PathVariable("idreserva") int idreserva){
	try {
			Optional<Reserva> resOP = repoR.findById(idreserva);
			if (resOP.isPresent()) {
				Reserva resAprob = resOP.get();
				
				if( resAprob.getEstado()!=ReservaEstado.PENDIENTE ) {
					return new ResponseEntity<>(HttpStatus.NOT_ACCEPTABLE);
				}
				
				resAprob.setEstado(ReservaEstado.RECHAZADO);

				repoR.save(resAprob);
				return new ResponseEntity<>( HttpStatus.OK);
			} else {
				return new ResponseEntity<>(HttpStatus.NOT_FOUND);
			}	
		} catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

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
	
	@RequestMapping(value = "/listarDatosRequeridosCalificar", method = { RequestMethod.POST })
    public ResponseEntity<List<DtCalificarDatosRequeridos>> listarDatosRequeridosCalificar(@RequestBody DtCalificarDatosRequeridosInput dtInput) {
		try {
			if( repoU.findById(dtInput.getIdHu()).isEmpty() ) {
				return new ResponseEntity<>( HttpStatus.NOT_FOUND );
			}
			
			List<DtCalificarDatosRequeridos> cDatos = repoA.listarDatosRequeridosCalificar(dtInput.getIdHu(), dtInput.getIdPais(), dtInput.getAloj_activo() );;
			
			return new ResponseEntity<>(cDatos, HttpStatus.OK);
		}
		catch(Exception e) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@RequestMapping(value = "/alta", method = { RequestMethod.POST })
	public ResponseEntity<Reserva> realizarReserva(@RequestBody DtAltaReserva dtAltaRes) {
		
		try {
			
			DtFecha dtFInicio= new DtFecha( 
					Integer.parseInt( dtAltaRes.getFInicio().substring(0, 4) ),
					Integer.parseInt( dtAltaRes.getFInicio().substring(5, 7) ),
					Integer.parseInt( dtAltaRes.getFInicio().substring(8, 10) )
				);
			DtFecha dtFFin = new DtFecha( 
					Integer.parseInt( dtAltaRes.getFFin().substring(0, 4) ),
					Integer.parseInt( dtAltaRes.getFFin().substring(5, 7) ),
					Integer.parseInt( dtAltaRes.getFFin().substring(8, 10) )
				);
					
			
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
			
			Date fIniSolicitudRes = dtFecha2Date(dtFInicio);

			Date fFinSolicitudRes = dtFecha2Date(dtFFin);
			
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
	
	private List<DtReserva> obtenerDtReservas(List<Reserva> rs) {
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

	@RequestMapping(value = "/listarReservasEjecutadasAnf/{idAnf}", method = { RequestMethod.GET })
	public ResponseEntity< List<DtReserva> > listarReservasEjecutadasAnf(@PathVariable int idAnf) {
		try {
			List<Reserva> reservas =  repoR.reservasEjecutadasAnf(idAnf);
			
			Optional usrOpt = repoU.findById(idAnf);
			
			if( !usrOpt.isPresent() || !(usrOpt.get() instanceof Anfitrion ) ) {
				return new ResponseEntity<>( 
						getHeaderError("No existe un usuario anfitrión con el id ingresado."), 
						HttpStatus.NOT_FOUND 
					);
			}
			
			if(reservas==null || reservas.size()==0) {
				
				return new ResponseEntity<>( 
						getHeaderError("No se encontraron reservas ejecutadas."), 
						HttpStatus.NO_CONTENT 
					);
			}
			List<DtReserva> dtReservas = obtenerDtReservas(reservas);
			return new ResponseEntity<>( dtReservas, HttpStatus.OK);
		}
		catch(Exception e ) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@RequestMapping( value = "/listarResenas", method = { RequestMethod.POST })
	public ResponseEntity< List<DtResena> > listarResenas(@RequestBody DtFiltroResenas filtros){
		
		if(filtros.getCalAnfitrion()==null ) {
			filtros.setCalAnfitrion( 0 );
		}
		
		if(filtros.getCalHuesped()==null ) {
			filtros.setCalHuesped(0);
		}
		
		if(filtros.getFFin()==null ) {
			filtros.setFFin( new DtFecha(01, 01, 2200) );
		}
		
		if(filtros.getFInicio()==null ) {
			filtros.setFInicio( new DtFecha(01, 01, 2000) );
		}
		
		try {
			Date fechaIni = dtFecha2Date(filtros.getFInicio());
			
			Date fechaFin = dtFecha2Date(filtros.getFFin());
			
			List<DtResena> resenas =  repoC.getResenasEnAlojamiento( 
					filtros.getIdAloj(), 
					fechaIni, fechaFin,
					filtros.getCalAnfitrion(), filtros.getCalHuesped()
				);
			if( resenas!=null && resenas.size()==0 ) {
				return new ResponseEntity<>(HttpStatus.NOT_FOUND);
			}
			else {
				return new ResponseEntity<>(resenas, HttpStatus.OK);
			}
		}
		catch(Exception e) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@RequestMapping(value = "/listarReservasAprobadasHuesp/{idAnf}", method = { RequestMethod.GET })
	public ResponseEntity< List<DtReserva> > listarReservasAprobadasHuesp(@PathVariable int idHu) {
		try {
			List<Reserva> reservas =  repoR.reservasAprobadasHuesp(idHu);
			if(reservas==null || reservas.size()==0) {
				return new ResponseEntity<>( HttpStatus.NO_CONTENT);
			}
			List<DtReserva> dtReservas = obtenerDtReservas(reservas);
			return new ResponseEntity<>( dtReservas, HttpStatus.OK);
		}
		catch(Exception e ) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@RequestMapping(value = "/reservasHabitacion/{idHab}", method = { RequestMethod.GET })
	public ResponseEntity< List<DtReserva> > reservasEnHabitacion(@PathVariable int idHab) {
		try {
			List<Reserva> reservas =  repoR.reservasHabitacion(idHab);
			if(reservas==null || reservas.size()==0) {
				return new ResponseEntity<>( HttpStatus.NO_CONTENT);
			}
			List<DtReserva> dtReservas = obtenerDtReservas(reservas);
			return new ResponseEntity<>( dtReservas, HttpStatus.OK);
		}
		catch(Exception e ) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@RequestMapping(value = "/reservasAlojamiento/{idHab}", method = { RequestMethod.GET })
	public ResponseEntity< List<DtReserva> > reservasAlojamiento(@PathVariable int idHab) {
		try {
			List<Reserva> reservas =  repoR.reservasAlojamiento(idHab);
			if(reservas==null || reservas.size()==0) {
				return new ResponseEntity<>( HttpStatus.NO_CONTENT);
			}
			List<DtReserva> dtReservas = obtenerDtReservas(reservas);
			return new ResponseEntity<>( dtReservas, HttpStatus.OK);
		}
		catch(Exception e ) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@RequestMapping(value = "/reservasXHuespXEstado", method = { RequestMethod.POST })
	public ResponseEntity< List<DtReservaAlojHab> > reservasXHuespConEstado( @RequestBody DtResHuespEstado filtro ){
		try {
			Optional usrOpt = repoU.findById(filtro.getIdHu() );
			if(!usrOpt.isPresent() || !( usrOpt.get() instanceof Huesped ) ) {
				return new ResponseEntity<>( HttpStatus.NOT_FOUND );
			}
			if(filtro.getResEstado()== null || filtro.getResEstado().isEmpty()) {
				filtro.setResEstado( new ArrayList<ReservaEstado>() );
				filtro.getResEstado().add(ReservaEstado.APROBADO);
				filtro.getResEstado().add(ReservaEstado.EJECUTADA);
				filtro.getResEstado().add(ReservaEstado.PENDIENTE);
				filtro.getResEstado().add(ReservaEstado.RECHAZADO);
			}
			
			//pasaje de datos a dt
			DtReservaAlojHab resAlojHab;
			List<DtReservaAlojHab> resAlojHabs = new ArrayList<DtReservaAlojHab>();
			List<DtReservaAlojamiento> resAlojs = new ArrayList<DtReservaAlojamiento>();
			
			resAlojs = repoR.findReservasXHuespConEstado(filtro.getIdHu(), filtro.getResEstado() );
			
			for(DtReservaAlojamiento resA : resAlojs ) {
				resAlojHab = new DtReservaAlojHab();
				
				resAlojHab.setRes_id(resA.getReserva().getId());
				resAlojHab.setRes_estado( resA.getReserva().getEstado());
				resAlojHab.setRes_fechaInicio( resA.getReserva().getFechaInicio() );
				resAlojHab.setRes_fechaFin( resA.getReserva().getFechaFin() );
				resAlojHab.setRes_cantDias( resA.getReserva().getCantDias() );;
				resAlojHab.setRes_calificacion( resA.getReserva().getCalificacion() );;
				
				resAlojHab.setAloj_id( resA.getAlojamiento().getId() );
				resAlojHab.setAloj_activo( resA.getAlojamiento().getActivo() ) ;
				resAlojHab.setAloj_descripcion( resA.getAlojamiento().getDescripcion() );
				resAlojHab.setAloj_idAnfitrion( resA.getAlojamiento().getAnfitrion().getId() );
				resAlojHab.setAloj_direccion( resA.getAlojamiento().getDireccion() );
				resAlojHab.setAloj_nombre( resA.getAlojamiento().getNombre() );
				
				resAlojHab.setHab_id( resA.getHabitacion().getId() );
				resAlojHab.setHab_descripcion( resA.getHabitacion().getDescripcion() );
				resAlojHab.setHab_precioNoche( resA.getHabitacion().getPrecioNoche());
				resAlojHab.setHab_camas( resA.getHabitacion().getCamas() );
				resAlojHab.setHab_servicios( resA.getHabitacion().getServicios() );
				
				resAlojHabs.add(resAlojHab);
			}
			
			return new ResponseEntity<>( resAlojHabs , HttpStatus.OK );
		}
		catch(Exception e) {
			return new ResponseEntity<>( HttpStatus.INTERNAL_SERVER_ERROR );
		}
		
	}
	
	// ####################### Funciones de Facturas #######################
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
	
	
	
	// ####################### Funciones Auxiliares #######################
	@RequestMapping(value = "/estadisticas", method = { RequestMethod.POST })
	public List<List<DtXY>> getEstadisticas( @RequestBody DtFiltrosEstadisticas dtFiltros ){
		List<List<DtXY>> retorno = new ArrayList<>();
		List<DtXY> dtXYs = new ArrayList<DtXY>(); 
		
		Date fIni  = dtFecha2Date ( dtFiltros.getDtFIni() );
		Date fFin  = dtFecha2Date ( dtFiltros.getDtFFin() );
		
		List<DtAnioMes> dtAniosMeses = getRangoMeses(fIni,  fFin);
		
		DtXY dtXY;
		
		Integer cantXAnioMes;
		for( DtAnioMes dtAnioMes : dtAniosMeses ) {
			cantXAnioMes = repoR.estadisticaResXMes(dtAnioMes.getAnio(), dtAnioMes.getMes());
			dtXY = new DtXY( 
							dtAnioMes.getAnio().toString()+'-'+dtAnioMes.getMes().toString(), 
							cantXAnioMes 
						);
			dtXYs.add(dtXY);
		}
		
		retorno.add(dtXYs);
		
		return retorno;
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
	
	private HttpHeaders getHeaderError( String error ) {
		HttpHeaders responseHeaders = new HttpHeaders();
	   responseHeaders.set(HEADER_ERROR, error);
	   return responseHeaders;
	}
	
	private List<DtAnioMes> getRangoMeses(Date fIni, Date fFin){
		List<DtAnioMes> retorno = new ArrayList<DtAnioMes>();
		
		Integer anioFIni = Integer.parseInt( (new SimpleDateFormat("yyyy")).format(fIni) );  
		Integer mesFIni = Integer.parseInt( (new SimpleDateFormat("MM")).format(fIni) );
		
		Integer anioFFin = Integer.parseInt( (new SimpleDateFormat("yyyy")).format(fFin) );  
		Integer mesFFin = Integer.parseInt( (new SimpleDateFormat("MM")).format(fFin) );
		
		Integer anioIter = anioFIni;
		Integer mesIter = mesFIni;
		while( anioIter.compareTo(anioFFin) < 0  || 
				( anioIter.equals(anioFFin) && mesIter.compareTo(mesFFin) <= 0 ) 
			) {
			retorno.add( new DtAnioMes( anioIter, mesIter ) );
			if( mesIter ==12 ) {
				anioIter++;
				mesIter=1;
			}
			else {
				mesIter++;
			}
		}
		return retorno;
	}
}