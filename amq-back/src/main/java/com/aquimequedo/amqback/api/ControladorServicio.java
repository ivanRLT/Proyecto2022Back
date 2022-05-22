package com.aquimequedo.amqback.api;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.bind.annotation.CrossOrigin;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import amq.datatypes.*;
import amq.entidades.Fabrica;
import amq.enums.AprobacionEstado;
import amq.enums.ReservaEstado;

import amq.interfacescontroladores.*;

@RestController
@RequestMapping()
@CrossOrigin(origins="*")
public class ControladorServicio {
	
	private Fabrica  fabrica;
	private IcUsuario iconU;
	private IcAlojamiento iconA;
	private IcReserva iconR;
	
	public ControladorServicio() {
		fabrica = Fabrica.getInstancia();
		iconU = fabrica.getIControladorUsuario();
		iconA = fabrica.getIControladorAlojamiento();
		iconR = fabrica.getIControladorReserva();
	}
	
	@CrossOrigin(origins="*")
	@RequestMapping(value = "/alojamientos", method = { RequestMethod.POST,  RequestMethod.GET })
	public String[][] listarAlojamientos(){
		return generarAlojamientos2();
	}
	
	@CrossOrigin(origins="*")
	@RequestMapping(value = "/usuarios", method = { RequestMethod.POST,  RequestMethod.GET })
	public String[][] listarUsuarios(){
		return generarUsuarios2();
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
	
	private String[][] generarAlojamientos2(){
		String[][] alHab= new String[4][13];
		
		alHab[0][0] = "true";
		alHab[0][1] = "Casa en la playa.";
		alHab[2][2] = "Rambla República de Mexico 3453 esq. San Nicolás";
		alHab[0][3] = "Casa Grande";
		alHab[0][4] = "Habitación principal";
		alHab[0][5] = "3200";
		alHab[0][6] = "3";
		alHab[0][7] = "true";
		alHab[0][8] = "false";
		alHab[0][9] = "true";
		alHab[0][10] = "false";
		alHab[0][11] = "false";
		alHab[0][12] = "true";
		
		alHab[1][0] = "true";
		alHab[1][1] = "Hotel ubicado a pasos de las termas de Arapey.";
		alHab[1][2] = "Termas del Arapey 3523, Salto";
		alHab[1][3] = "Arapey Oasis Termal";
		alHab[1][4] = "Habitación 105";
		alHab[1][5] = "5200";
		alHab[1][6] = "3";
		alHab[1][7] = "false";
		alHab[1][8] = "false";
		alHab[1][9] = "true";
		alHab[1][10] = "true";
		alHab[1][11] = "false";
		alHab[1][12] = "false";
		
		alHab[2][0] = "true";
		alHab[2][1] = "El mejor Hotel de Piriapolis La limpieza y el buen trato son su especialidad. En cuanto a las comodidades y el servicio del Hotel son geniales; habitaciones, comedor, sala de juegos, pileta, parque...Buen desayuno y te facilitan sillas y toallas para ir a la Playa. Todas las habitaciones tienen una vista excelente, destacandoce las de frente.";
		alHab[2][2] = "Pasaje Superior Piria entre Junín y Suipacha";
		alHab[2][3] = "Hotel Ricadi";
		alHab[2][4] = "SUP c/terraza";
		alHab[2][5] = "5000";
		alHab[2][6] = "3";
		alHab[2][7] = "true";
		alHab[2][8] = "false";
		alHab[2][9] = "true";
		alHab[2][10] = "true";
		alHab[2][11] = "false";
		alHab[2][12] = "false";
		
		alHab[3][0] = "true";
		alHab[3][1] = "El mejor Hotel de Piriapolis La limpieza y el buen trato son su especialidad. En cuanto a las comodidades y el servicio del Hotel son geniales; habitaciones, comedor, sala de juegos, pileta, parque...Buen desayuno y te facilitan sillas y toallas para ir a la Playa. Todas las habitaciones tienen una vista excelente, destacandoce las de frente.";
		alHab[3][2] = "Pasaje Superior Piria entre Junín y Suipacha";
		alHab[3][3] = "Hotel Ricadi";
		alHab[3][4] = "STANDARD DOBLE";
		alHab[3][5] = "3800";
		alHab[3][6] = "1";
		alHab[3][7] = "false";
		alHab[3][8] = "false";
		alHab[3][9] = "false";
		alHab[3][10] = "false";
		alHab[3][11] = "false";
		alHab[3][12] = "false";
		
	
		
		return alHab;
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
	
	private String[][] generarUsuarios2(){
		String[][] usrs= new String[4][8];
		
		usrs[0][0] = "administrador";
		usrs[0][1] = "admin1@mail.com";
		usrs[0][2] = "nombreAdmin1";
		usrs[0][3] = "apellAdmin1";
		usrs[0][4] = "true";
		usrs[0][5] = "";
		usrs[0][6] = "";
		usrs[0][7] = "";

		usrs[1][0] = "anfitrion";
		usrs[1][1] = "anfi1@mail.com";
		usrs[1][2] = "nombreAnfi1";
		usrs[1][3] = "apellAnfi1";
		usrs[1][4] = "true";
		usrs[1][5] = "0";
		usrs[1][6] = "APROBADO";
		usrs[1][7] = "";
		
		usrs[2][0] = "huesped";
		usrs[2][1] = "hue1@mail.com";
		usrs[2][2] = "nombreHue1";
		usrs[2][3] = "apellHue1";
		usrs[2][4] = "true";
		usrs[2][5] = "";
		usrs[2][6] = "";
		usrs[2][7] = "5";
		
		usrs[2][0] = "huesped";
		usrs[2][1] = "hue2@mail.com";
		usrs[2][2] = "nombreHue2";
		usrs[2][3] = "apellHue2";
		usrs[2][4] = "true";
		usrs[2][5] = "";
		usrs[2][6] = "";
		usrs[2][7] = "0";
		
		return usrs;
	}
	
	// ##############################SERVICIOS#######################################
	
	@CrossOrigin(origins="*")
	@RequestMapping(value = "/iniciarSesion", method = { RequestMethod.POST,  RequestMethod.GET })
	public DtUsuario iniciarSesion(String email, String pass){
		return iconU.iniciarSesion(email, pass);
	}
	
	
}