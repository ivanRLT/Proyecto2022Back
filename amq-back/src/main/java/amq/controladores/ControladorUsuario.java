package amq.controladores;

import amq.entidades.Usuario;
import amq.interfacescontroladores.IcUsuario;
import amq.manejadores.ManejadorAlojamiento;
import amq.manejadores.ManejadorReserva;
import amq.manejadores.ManejadorUsuario;

public class ControladorUsuario implements IcUsuario{
	public boolean altaUsuario() {
		Boolean retorno = false;
		try {
			ManejadorUsuario mU = ManejadorUsuario.getInstancia();
		} catch (Exception e) {
			// TODO: handle exception
		}		
		return retorno;
	}
	public boolean modificarUsuario() {
		Boolean retorno = false;
		try {
			ManejadorUsuario mU = ManejadorUsuario.getInstancia();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return retorno;
	}
	public void buscarUsuario(int id, String email) {
		try {
			ManejadorUsuario mU = ManejadorUsuario.getInstancia();
			//posibilidad de buscar por id o por correo independientemente
		} catch (Exception e) {
			// TODO: handle exception
		}
		//return dt
	}
	public boolean desactivarUsuario() {
		Boolean retorno = false;
		try {
			ManejadorUsuario mA = ManejadorUsuario.getInstancia();
		} catch (Exception e) {
			// TODO: handle exception
		}	
		return retorno;
	}
	// #######################Funciones de Anfitrion#######################
	public boolean agregarAlojamientoAnfitrion() {
		Boolean retorno = false;
		try {
			ManejadorUsuario mU = ManejadorUsuario.getInstancia();
			
		} catch (Exception e) {
			// TODO: handle exception
		}	
		return retorno;
	}
	public void listarAlojamientosAnfitrion() {
		// TODO cambiar retorno por list de dtAlojamiento
		try {
			ManejadorUsuario mU = ManejadorUsuario.getInstancia();
			
		} catch (Exception e) {
			// TODO: handle exception
		}	
	}
	public boolean cambiarEstadoAnfitrion() {
		Boolean retorno = false;
		try {
			ManejadorUsuario mU = ManejadorUsuario.getInstancia();
			
		} catch (Exception e) {
			// TODO: handle exception
		}	
		return retorno;
	}
	// #######################Funciones de Huesped#######################
		public boolean agregarReservaHuesped() {
			Boolean retorno = false;
			try {
				ManejadorUsuario mU = ManejadorUsuario.getInstancia();
				ManejadorAlojamiento mA = ManejadorAlojamiento.getInstancia();
				
			} catch (Exception e) {
				// TODO: handle exception
			}	
			return retorno;
		}
		public void listarReservasHuesped() {
			// TODO cambiar retorno por list de dtReserva
			try {
				ManejadorUsuario mU = ManejadorUsuario.getInstancia();
				
			} catch (Exception e) {
				// TODO: handle exception
			}	
		}
		public boolean modificarReservaHuesped(int idReserva) {
			Boolean retorno = false;
			try {
				ManejadorReserva mU = ManejadorReserva.getInstancia();
				
			} catch (Exception e) {
				// TODO: handle exception
			}	
			return retorno;
		}
}
