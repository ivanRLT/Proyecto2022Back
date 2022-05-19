package amq.controladores;

import amq.entidades.Alojamiento;
import amq.interfacescontroladores.IcAlojamiento;

public class ControladorAlojamiento implements IcAlojamiento {
	// #######################Funciones de alojamiento#######################
	public boolean altaAlojamiento() {
		Boolean retorno = false;
		try {
			
		} catch (Exception e) {
			retorno = false;
		}
		
		
		return retorno;
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
	public void listarAlojamientos() {
		// TODO cambiar retorno por list de dtAlojamiento
		try {
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	// #######################Funciones de habitacion#######################
	public Boolean agregarHabitaciones(int idAlojamiento, String dtHabitacion) {
		//TODO remplazar string por list de dt
		Boolean retorno = false;
		try {

			retorno = true;
		} catch (Exception e) {
			retorno = false;
		}
		return retorno;
	}
	public Boolean consultaHabitacion(int idAlojamiento, int idHabitacion) {
		//TODO consultaHabitacion
		Boolean retorno = false;
		try {	
			
			retorno = true;
		} catch (Exception e) {
			retorno = false;
		}
		return retorno;
	}
	public Boolean listarHabitaciones(int idAlojamiento) {
		//TODO listarHabitaciones
		Boolean retorno = false;
		try {
			
			retorno = true;
		} catch (Exception e) {
			retorno = false;
		}
		return retorno;
	}
	public Boolean modificarHabitaciones(int idAlojamiento, String dtHabitacion) {
		//TODO remplazar string por list de dt
		Boolean retorno = false;
		try {
			
			retorno = true;
		} catch (Exception e) {
			retorno = false;
		}
		return retorno;
	}
}
