package amq.controladores;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import amq.entidades.Administrador;
import amq.entidades.Anfitrion;
import amq.entidades.Huesped;
import amq.entidades.Usuario;
import amq.interfacescontroladores.IcUsuario;
import amq.datatypes.DtAdministrador;
import amq.datatypes.DtAlojamiento;
import amq.datatypes.DtAnfitrion;
import amq.datatypes.DtHuesped;
import amq.datatypes.DtReserva;
import amq.datatypes.DtUsuario;
import amq.interfacescontroladores.IcReserva;

public class ControladorUsuario implements IcUsuario{
	private IcReserva iconR;
	
	public boolean altaUsuario() {
		Boolean retorno = false;
		try {

		} catch (Exception e) {
			// TODO: handle exception
		}		
		return retorno;
	}
	
	public boolean modificarUsuario() {
		Boolean retorno = false;
		try {

		} catch (Exception e) {
			// TODO: handle exception
		}
		return retorno;
	}
	
	public void buscarUsuario(int id, String email) {
		try {

			//posibilidad de buscar por id o por correo independientemente
		} catch (Exception e) {
			// TODO: handle exception
		}
		//return dt
	}
	
	public boolean desactivarUsuario() {
		Boolean retorno = false;
		try {

		} catch (Exception e) {
			// TODO: handle exception
		}	
		return retorno;
	}
	
	public List<DtUsuario> listarUsuarios (){
		List<Usuario> usuarios = new ArrayList<Usuario>();
		List<DtUsuario> retorno = new ArrayList<DtUsuario>();
		try {
			// TODO coneccion BD		
			for (Usuario u:usuarios) {
				if (u instanceof Administrador) {
					DtAdministrador dtadmin = new DtAdministrador(u.getEmail(),u.getNombre(), u.getApellido(),u.getActivo());
					retorno.add(dtadmin);
				}else if (u instanceof Anfitrion) {
					Anfitrion ua = (Anfitrion) u;
					DtAnfitrion dtanfitrion = new DtAnfitrion(ua.getEmail(),ua.getNombre(), ua.getApellido(),ua.getActivo(), ua.getCalificacionGlobal(), ua.getEstado());
					retorno.add(dtanfitrion);
				}else if (u instanceof Huesped) {
					Huesped uh = (Huesped) u;
					List<DtReserva> reservasdt = iconR.obtenerDtReservas(uh.getReservas());
					DtHuesped dthuesped = new DtHuesped(uh.getEmail(),uh.getNombre(), uh.getApellido(),uh.getActivo(), uh.getCalificacionGlobal(), uh.getPushTokens(), reservasdt);
					retorno.add(dthuesped);
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		}	
		return retorno;
	}
	
	// #######################Funciones de Anfitrion#######################
	public boolean agregarAlojamientoAnfitrion() {
		Boolean retorno = false;
		try {
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}	
		return retorno;
	}
	
	public List<DtAlojamiento> listarAlojamientosAnfitrion(){
		try {

		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	
	public boolean cambiarEstadoAnfitrion() {
		Boolean retorno = false;
		try {

			
		} catch (Exception e) {
			// TODO: handle exception
		}	
		return retorno;
	}
	
	// #######################Funciones de Huesped#######################
	public boolean agregarReservaHuesped() {
		Boolean retorno = false;
		try {
			
		} catch (Exception e) {
			// TODO: handle exception
		}	
		return retorno;
	}
	
	public List<DtReserva> listarReservasHuesped() {
		try {
		
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	
	public boolean modificarReservaHuesped(int idReserva) {
		Boolean retorno = false;
		try {
			
		} catch (Exception e) {
			// TODO: handle exception
		}	
		return retorno;
	}
}
