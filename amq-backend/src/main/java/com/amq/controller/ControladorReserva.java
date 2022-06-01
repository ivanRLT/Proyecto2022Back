package com.amq.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.amq.datatypes.DtCalificacion;
import com.amq.datatypes.DtFactura;
import com.amq.datatypes.DtFecha;
import com.amq.datatypes.DtReserva;
import com.amq.enums.PagoEstado;
import com.amq.enums.ReservaEstado;
import com.amq.model.Calificacion;
import com.amq.model.Factura;
import com.amq.model.Habitacion;
import com.amq.model.Huesped;
import com.amq.model.Reserva;
import com.amq.model.Usuario;
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
    private JavaMailSender mailSender;
	
	@Autowired
	private IUsuarioService userService;
	
	 @Autowired
	 private MessageSource messages;
	
	@RequestMapping(value = "/confirmarReserva/{idreserva}", method = { RequestMethod.POST })	
	public ResponseEntity<Factura> confirmarReserva(@PathVariable("idreserva") int idreserva, @RequestBody DtFactura facturadt){
		try {
			Optional<Reserva> resOP = repoR.findById(idreserva);
			if (resOP.isPresent()) {
				Reserva reservaC = resOP.get();
				Habitacion habitacion = reservaC.getHabitacion();
				List<Reserva> reservasH = habitacion.getReservas();
				Boolean solapamiento = false;
				for (Reserva r : reservasH) {
					DtFecha reservasRI = r.getFechaInicio();
					DtFecha reservasRF = r.getFechaFin();
					DtFecha reservaI = reservaC.getFechaInicio();
					DtFecha reservaF = reservaC.getFechaFin();
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
	
	@RequestMapping(value = "/realizarReserva/{iduser}", method = { RequestMethod.POST })
	public ResponseEntity<Reserva> realizarReserva(@PathVariable("iduser") int iduser, @RequestParam int idhab, @RequestParam int cantdias, @RequestBody DtFecha fechaInicio, @RequestBody DtFecha fechaFin, @RequestParam double descuento, @RequestParam String idPaypal) {
		try {
			Optional<Usuario> uOP = repoU.findById(iduser);
			if (uOP.isPresent()) {
				Optional<Habitacion> hOP = repoH.findById(idhab);
				if (hOP.isPresent()) {
					if (uOP.get() instanceof Huesped) {
						Boolean solapamiento = false;
						Habitacion habitacion = hOP.get();
						List<Reserva> reservasH = habitacion.getReservas();
						for (Reserva r : reservasH) {
							DtFecha reservasRI = r.getFechaInicio();
							DtFecha reservasRF = r.getFechaFin();
							DtFecha reservaI = fechaInicio;
							DtFecha reservaF = fechaFin;
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
							Huesped huesped = (Huesped) uOP.get();						
							Reserva reserva = new Reserva();
							reserva.setCalificacion(null);
							reserva.setCantDias(cantdias);
							reserva.setEstado(ReservaEstado.PENDIENTE);
							reserva.setFechaInicio(fechaInicio);
							reserva.setFechaFin(fechaFin);
							reserva.setIdChat("");
							reserva.setHuesped(huesped);
							habitacion.agregarReserva(reserva);
							huesped.addReserva(reserva);
							Factura factura = new Factura();
							double monto = habitacion.getPrecioNoche() * reserva.getCantDias();					
							if (descuento != 0) {
								factura.setDescuento(true);
								factura.setMontoDescuento(descuento);
								factura.setMonto(monto - descuento);
							}else {
								factura.setMonto(monto);
							}
							factura.setEstado(PagoEstado.PENDIENTE);
							factura.setReserva(reserva);
							LocalDate fecha = LocalDate.now();
							DtFecha fechadt = new DtFecha(fecha.getYear(), fecha.getMonthValue(), fecha.getDayOfMonth());
							factura.setFecha(fechadt);
							factura.setIdPaypal(idPaypal);
							repoF.save(factura);
							reserva.agregarFactura(factura);
							repoU.save(huesped);
							repoH.save(habitacion);
							Reserva rRet = repoR.save(reserva);
				
							return new ResponseEntity<>(rRet, HttpStatus.CREATED);
						}else {
							return new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
						}
					}else {
						return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
					}		
				}else {
					return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
				}	
			}else {
				return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
			}
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
			DtReserva reservadt = new DtReserva(r.getEstado(),r.getFechaInicio(),r.getFechaFin(),r.getIdChat(),r.getCantDias(), facturasdt, califdt);
			retorno.add(reservadt);
		}
		return retorno;
	}
	// #######################Funciones de Calificacion#######################
	public boolean altaCalificacion() {
		Boolean retorno = false;
		try {

		} catch (Exception e) {
			// TODO: handle exception
		}
		return retorno;
	}
	public boolean modificarCalificacion(int idReserva) {
		Boolean retorno = false;
		try {

		} catch (Exception e) {
			// TODO: handle exception
		}
		return retorno;
	}
	public DtCalificacion listarCalificacion(int idReserva) {
		try {

		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
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
}
