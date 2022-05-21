package com.aquimequedo.amqback.api;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import amq.datatypes.*;
import amq.enums.AprobacionEstado;
import amq.enums.ReservaEstado;

@RestController
@RequestMapping()
public class ControladorServicio {
	@RequestMapping(value = "/alojamientos", method = { RequestMethod.POST,  RequestMethod.GET })
	public List<DtAlojamiento> listarAlojamientos(){
		return generarAlojamientos();
	}
	
	@RequestMapping(value = "/usuarios", method = { RequestMethod.POST,  RequestMethod.GET })
	public List<DtUsuario> listarUsuarios(){
		return generarUsuarios();
	}
	
	private List<DtAlojamiento> generarAlojamientos(){
		List<DtAlojamiento> listAloj = new ArrayList<DtAlojamiento>();
		
		DtServicios serv;
		DtHabitacion hab;
		List<DtHabitacion> habs;
		DtAlojamiento aloj;
		
		serv = new DtServicios(true, false, false, true, false, false);
		hab = new DtHabitacion("Habitación principal", (double) 3200, 3, serv, null);
		habs = new ArrayList<DtHabitacion>();
		habs.add(hab);
		aloj  = new DtAlojamiento(
				true,
				"Casa en la playa.", 
				"Rambla República de Mexico 3453 esq. San Nicolás",
				"Casa Grande"
			);
		aloj.setHabitaciones(habs);
		listAloj.add(aloj);
		
		//##################################################################################
		habs = new ArrayList<DtHabitacion>();
		serv = new DtServicios(true, true, true, true, false, false);
		hab = new DtHabitacion("Habitación 105", (double) 5200, 3, serv, null);
		habs.add(hab);
		
		serv = new DtServicios(true, true, false, true, false, false);
		hab = new DtHabitacion("Habitación 133", (double) 3800, 2, serv, null);
		habs.add(hab);
		
		aloj  = new DtAlojamiento(
				true,
				"Hotel ubicado a pasos de las termas de Arapey.", 
				"Termas del Arapey 3523, Salto",
				"Arapey Oasis Termal"
			);
		aloj.setHabitaciones(habs);
		listAloj.add(aloj);
		//##################################################################################
		habs = new ArrayList<DtHabitacion>();
		serv = new DtServicios(true, true, true, true, true, true);
		hab = new DtHabitacion("SUP c/terraza", (double) 5200, 3, serv, null);
		habs.add(hab);
		
		serv = new DtServicios(true, false, false, true, false, false);
		hab = new DtHabitacion("STANDARD DOBLE", (double) 3800, 2, serv, null);
		habs.add(hab);
		
		aloj  = new DtAlojamiento(
				true,
				"El mejor Hotel de Piriapolis La limpieza y el buen trato son su especialidad. En cuanto a las comodidades y el servicio del Hotel son geniales; habitaciones, comedor, sala de juegos, pileta, parque...Buen desayuno y te facilitan sillas y toallas para ir a la Playa. Todas las habitaciones tienen una vista excelente, destacandoce las de frente.", 
				"Pasaje Superior Piria entre Junín y Suipacha",
				"Hotel Ricadi"
			);
		aloj.setHabitaciones(habs);
		listAloj.add(aloj);
		
		//##################################################################################
		ArrayList<DtReserva> ress = new ArrayList<DtReserva>();
		DtReserva res = new DtReserva(ReservaEstado.PENDIENTE, new DtFecha(31, 10, 2022), new DtFecha(04, 11, 2022), null, 4, null, null);
		ress.add(res);
		res = new DtReserva(ReservaEstado.PENDIENTE, new DtFecha(30, 10, 2022), new DtFecha(01, 11, 2022), null, 2, null, null);
		ress.add(res);
		
		habs = new ArrayList<DtHabitacion>();
		serv = new DtServicios(true, true, true, true, true, true);
		hab = new DtHabitacion("Habitación única", (double) 8200, 8, serv, ress);
		habs.add(hab);
		
		aloj  = new DtAlojamiento(
				true,
				"Casona  de lujo.", 
				"25 de agosto, san luis",
				"Casona con piscina grande, todos los lujos =D"
			);
		aloj.setHabitaciones(habs);
		listAloj.add(aloj);
		
		return listAloj;
	}
	
	private List<DtUsuario> generarUsuarios(){
		List<DtAlojamiento> alojs1 = generarAlojamientos();
		alojs1.remove(0);
		alojs1.remove(0);
		List<DtAlojamiento> alojs2 = generarAlojamientos();
		alojs2.remove(2);
		alojs2.remove(2);
		
		List<DtUsuario> usrs = new ArrayList<DtUsuario>();
		DtAdministrador admin = new DtAdministrador("emailAdmin@mail.com", 
				"nombreAdmin", 
				"apellidoAdmin", 
				true);
		usrs.add(admin);
		
		DtAnfitrion anfi = new DtAnfitrion(
				"emailAnfi1@mail.com", 
				"nombreAnfi1", 
				"apellidoAnfi1", 
				true, 
				33, 
				AprobacionEstado.APROBADO, 
				alojs1);
		usrs.add(anfi);
		anfi = new DtAnfitrion(
				"emailAnfi2@mail.com", 
				"nombreAnfi2", 
				"apellidoAnfi2", 
				true, 
				3, 
				AprobacionEstado.APROBADO, 
				alojs2);
		usrs.add(anfi);
		
		DtHuesped huesp = new DtHuesped(
				"emailHuesp1@mail.com", 
				"nombreHuesp1", 
				"apellidoHuesp1", 
				true, 
				12, 
				null, 
				alojs1.get(1).getHabitaciones().get(0).getDtReservas());
		usrs.add(huesp);
		return usrs;
	}
}