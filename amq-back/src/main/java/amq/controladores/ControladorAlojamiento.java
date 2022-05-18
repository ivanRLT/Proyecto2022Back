package amq.controladores;

import amq.entidades.Alojamiento;
import amq.interfacescontroladores.IcAlojamiento;
import amq.manejadores.ManejadorAlojamiento;

public class ControladorAlojamiento implements IcAlojamiento {
	// #######################Funciones de alojamiento#######################
	public boolean altaAlojamiento() {
		Boolean retorno = false;
		try {
			ManejadorAlojamiento mA = ManejadorAlojamiento.getInstancia();
			
		} catch (Exception e) {
			retorno = false;
		}
		
		
		return retorno;
	}
	public boolean modificarAlojamiento() {
		Boolean retorno = false;
		try {
			ManejadorAlojamiento mA = ManejadorAlojamiento.getInstancia();
			
		} catch (Exception e) {
			retorno = false;
		}	
		return retorno;
	}
	public void buscarAlojamiento(int id) {
		
		try {
			ManejadorAlojamiento mA = ManejadorAlojamiento.getInstancia();
		} catch (Exception e) {
			// TODO: handle exception
		}	
		//return dtAlojamiento
	}
	public Boolean desactivarAlojamiento() {
		Boolean retorno = false;
		try {
			ManejadorAlojamiento mA = ManejadorAlojamiento.getInstancia();
			
		} catch (Exception e) {
			retorno = false;
		}	
		return retorno;
	}
	public void listarAlojamientos() {
		// TODO cambiar retorno por list de dtAlojamiento
		try {
			ManejadorAlojamiento mA = ManejadorAlojamiento.getInstancia();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	// #######################Funciones de habitacion#######################
	public Boolean agregarHabitaciones(int idAlojamiento, String dtHabitacion) {
		//TODO remplazar string por list de dt
		Boolean retorno = false;
		try {
			ManejadorAlojamiento mA = ManejadorAlojamiento.getInstancia();
			Alojamiento alojamiento = mA.buscarAlojamiento(idAlojamiento);
			
			alojamiento.setHabitaciones(null);
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
			ManejadorAlojamiento mA = ManejadorAlojamiento.getInstancia();
			Alojamiento alojamiento = mA.buscarAlojamiento(idAlojamiento);
			
			
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
			ManejadorAlojamiento mA = ManejadorAlojamiento.getInstancia();
			Alojamiento alojamiento = mA.buscarAlojamiento(idAlojamiento);
			
			
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
			ManejadorAlojamiento mA = ManejadorAlojamiento.getInstancia();
			Alojamiento alojamiento = mA.buscarAlojamiento(idAlojamiento);
			
			retorno = true;
		} catch (Exception e) {
			retorno = false;
		}
		return retorno;
	}
}
