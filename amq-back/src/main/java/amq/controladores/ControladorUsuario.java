package amq.controladores;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import amq.entidades.Administrador;
import amq.entidades.Alojamiento;
import amq.entidades.Anfitrion;
import amq.entidades.Huesped;
import amq.entidades.Usuario;
import amq.interfacescontroladores.IcUsuario;
import amq.datatypes.DtAdministrador;
import amq.datatypes.DtAlojamiento;
import amq.datatypes.DtAnfitrion;
import amq.datatypes.DtHabitacion;
import amq.datatypes.DtHuesped;
import amq.datatypes.DtReserva;
import amq.datatypes.DtUsuario;
import amq.interfacescontroladores.IcAlojamiento;
import amq.interfacescontroladores.IcReserva;

public class ControladorUsuario implements IcUsuario{
	private IcReserva iconR;
	private IcAlojamiento iconA;
	
	public boolean altaUsuario(DtUsuario usuario) {
		Boolean retorno = false;
		try {
			if (usuario instanceof DtAdministrador) {
				Administrador admin = new Administrador();
				admin.setActivo(usuario.isActivo());
				admin.setEmail(usuario.getEmail());
				admin.setApellido(usuario.getApellido());
				admin.setPass(usuario.getPass());
				admin.setNombre(usuario.getNombre());
				// TODO persistir en BD
				retorno = true;
			}else if (usuario instanceof DtAnfitrion) {
				Anfitrion anf = new Anfitrion();
				DtAnfitrion anfdt = (DtAnfitrion) usuario;
				anf.setActivo(usuario.isActivo());
				anf.setEmail(usuario.getEmail());
				anf.setApellido(usuario.getApellido());
				anf.setPass(usuario.getPass());
				anf.setNombre(usuario.getNombre());
				anf.setCalificacionGlobal(-1);
				anf.setEstado(anfdt.getEstado());
				List<DtAlojamiento> alojamientosdt = anfdt.getAlojamientos();
				DtAlojamiento alojamientodt = null;
				List<DtHabitacion> habitacionesdt = null;
				for (DtAlojamiento dta:alojamientosdt) {
					alojamientodt = dta;
					habitacionesdt = dta.getHabitaciones();
				}
				Alojamiento alojamiento = iconA.altaAlojamiento(alojamientodt,habitacionesdt);
				List<Alojamiento> alojamientos = new ArrayList<Alojamiento>();
				alojamientos.add(alojamiento);
				anf.setAlojamientos(alojamientos);
				// TODO persistir en BD
				retorno = true;
			}else if (usuario instanceof DtHuesped) {
				Huesped hue = new Huesped();
				hue.setActivo(usuario.isActivo());
				hue.setEmail(usuario.getEmail());
				hue.setApellido(usuario.getApellido());
				hue.setPass(usuario.getPass());
				hue.setNombre(usuario.getNombre());
				hue.setCalificacionGlobal(-1);
				hue.setPushTokens(null);
				hue.setReservas(null);

				// TODO persistir en BD
				retorno = true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			retorno = false;
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
					DtAnfitrion dtanfitrion = new DtAnfitrion(ua.getEmail(),ua.getNombre(), ua.getApellido(),ua.getActivo(), ua.getCalificacionGlobal(), ua.getEstado(),null);
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
	
	public DtUsuario iniciarSesion(String email, String pass) {
		DtUsuario retorno = null;
		try {
			// Coneccion BD
			Usuario user = null;
			if (user.getPass() == pass) {
				if (user instanceof Administrador) {
					retorno = new DtAdministrador(user.getEmail(), user.getNombre(), user.getApellido(), user.getActivo());
				}else if (user instanceof Anfitrion) {
					Anfitrion ua = (Anfitrion) user;
					retorno = new DtAnfitrion(user.getEmail(), user.getNombre(), user.getApellido(), user.getActivo(), ua.getCalificacionGlobal(), ua.getEstado(), null);
				}else if (user instanceof Huesped) {
					Huesped uH = (Huesped) user;
					retorno = new DtHuesped(user.getEmail(), user.getNombre(), user.getApellido(), user.getActivo(), uH.getCalificacionGlobal(),uH.getPushTokens(),null);
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
