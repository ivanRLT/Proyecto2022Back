package amq.manejadores;

import java.util.ArrayList;
import java.util.List;

import amq.entidades.Reserva;


public class ManejadorReserva {
	private static ManejadorReserva instancia = null;
	
	private ManejadorReserva() {};
	public static ManejadorReserva getInstancia() {
		if (instancia == null) 
			instancia = new ManejadorReserva();
		return instancia;
	}
	public Boolean agregarReserva(Reserva usuario) {
		//TODO Persitencia a BD agregar usuario
		Boolean retorno = false;
		try {
			
			retorno = true;
		} catch (Exception e) {
			retorno = false;
			// TODO: handle exception
		}
		return retorno;
	}
	public Boolean modificarReserva(Reserva usuario) {
		Boolean retorno = false;
		try {
			
			retorno = true;
		} catch (Exception e) {
			retorno = false;
			// TODO: handle exception
		}
		return retorno;
	}
	public Reserva buscarReserva(int id) {
		Reserva retorno = null;
		try {
			
			//retorno = true; TODO
		} catch (Exception e) {
			retorno = null;
			// TODO: handle exception
		}
		return retorno;
	}
}