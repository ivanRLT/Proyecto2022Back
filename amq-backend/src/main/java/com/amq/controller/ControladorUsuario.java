package com.amq.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.amq.datatypes.DtAdministrador;
import com.amq.datatypes.DtAlojamiento;
import com.amq.datatypes.DtAnfitrion;
import com.amq.datatypes.DtHabitacion;
import com.amq.datatypes.DtHuesped;
import com.amq.datatypes.DtReserva;
import com.amq.datatypes.DtUsuario;
import com.amq.model.Administrador;
import com.amq.model.Anfitrion;
import com.amq.model.Huesped;
import com.amq.model.Usuario;
import com.amq.repositories.RepositoryUsuario;

@CrossOrigin(origins = "http://localhost:8081")
@RestController
@RequestMapping("/api")
public class ControladorUsuario {
	
	@Autowired
	RepositoryUsuario repoU;
	
	@PostMapping("/altaAdmin")
	public ResponseEntity<Administrador> altaAdministrador(@RequestBody DtAdministrador adminDT) {
		try {
			Administrador aminR = repoU
					.save(new Administrador(adminDT.getEmail(), adminDT.isActivo(), adminDT.getApellido(), adminDT.getNombre(), adminDT.getPass()));
			return new ResponseEntity<>(aminR, HttpStatus.CREATED);
		} catch (Exception e) {
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}		
	}
	
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
				repoU.save(admin);
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
				/*
				Alojamiento alojamiento = iconA.altaAlojamiento(alojamientodt,habitacionesdt);
				List<Alojamiento> alojamientos = new ArrayList<Alojamiento>();
				alojamientos.add(alojamiento);
				anf.setAlojamientos(alojamientos);*/
				//uRepo.save(anf);
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
				//uRepo.save(hue);
				retorno = true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Exploto: " + e.toString());
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
					/*List<DtReserva> reservasdt = iconR.obtenerDtReservas(uh.getReservas());
					DtHuesped dthuesped = new DtHuesped(uh.getEmail(),uh.getNombre(), uh.getApellido(),uh.getActivo(), uh.getCalificacionGlobal(), uh.getPushTokens(), reservasdt);
					retorno.add(dthuesped);*/
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
