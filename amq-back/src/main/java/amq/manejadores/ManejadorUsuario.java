package amq.manejadores;

import java.util.ArrayList;
import java.util.List;

import amq.entidades.Administrador;
import amq.entidades.Anfitrion;
import amq.entidades.Huesped;
import amq.entidades.Usuario;

public class ManejadorUsuario {
	private static ManejadorUsuario instancia = null;
	
	private ManejadorUsuario() {};
	public static ManejadorUsuario getInstancia() {
		if (instancia == null) 
			instancia = new ManejadorUsuario();
		return instancia;
	}
	public Boolean agregarUsuario(Usuario usuario) {
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
	public Boolean modificarUsuario(Usuario usuario) {
		Boolean retorno = false;
		try {
			
			retorno = true;
		} catch (Exception e) {
			retorno = false;
			// TODO: handle exception
		}
		return retorno;
	}
	public Usuario buscarUsuario(int id) {
		Usuario retorno = null;
		try {
			
			//retorno = true; TODO
		} catch (Exception e) {
			retorno = null;
			// TODO: handle exception
		}
		return retorno;
	}
	// #######################Funciones de Administrador#######################
	public List<Administrador> getAdministradores(){
		// TODO get administradores
		return null;
	}
	// #######################Funciones de Anfitrion#######################
	public List<Anfitrion> getAnfitriones(){
		// TODO get Anfitriones
		return null;
	}
	// #######################Funciones de Huesped#######################
	public List<Huesped> getHuespedes(){
		// TODO get Huespedes
		return null;
	}
	
}
