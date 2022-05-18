package amq.manejadores;

import java.util.ArrayList;
import java.util.List;

import amq.entidades.Alojamiento;
import amq.entidades.Habitacion;

public class ManejadorAlojamiento {
	private static ManejadorAlojamiento instancia = null;
	
	private ManejadorAlojamiento() {};
	public static ManejadorAlojamiento getInstancia() {
		if (instancia == null) 
			instancia = new ManejadorAlojamiento();
		return instancia;
	}
	public Boolean agregarAlojamiento(Alojamiento usuario) {
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
	public Boolean modificarAlojamiento(Alojamiento usuario) {
		Boolean retorno = false;
		try {
			
			retorno = true;
		} catch (Exception e) {
			retorno = false;
			// TODO: handle exception
		}
		return retorno;
	}
	public Alojamiento buscarAlojamiento(int id) {
		Alojamiento retorno = null;
		try {
			
			//retorno = true; TODO
		} catch (Exception e) {
			retorno = null;
			// TODO: handle exception
		}
		return retorno;
	}
}