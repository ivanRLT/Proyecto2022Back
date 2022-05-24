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
			// Creo usuario para persistir 
			Administrador admin = new Administrador();
			admin.setActivo(adminDT.isActivo());
			admin.setEmail(adminDT.getEmail());
			admin.setApellido(adminDT.getApellido());
			admin.setPass(adminDT.getPass());
			admin.setNombre(adminDT.getNombre());
			// El "save" devuleve el usuario agregado si funciono y lo guardo en aux para devolverlo
			Administrador aminR = repoU.save(admin);
			
			return new ResponseEntity<>(aminR, HttpStatus.CREATED);
		} catch (Exception e) {
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}	
	}
	
	@PostMapping("/altaAnfitiron")
	public ResponseEntity<Anfitrion> altaAnfitrion(@RequestBody DtAnfitrion anfDT) {
		try {
			// Creo usuario para persistir 
			Anfitrion anf = new Anfitrion();
			anf.setActivo(anfDT.isActivo());
			anf.setEmail(anfDT.getEmail());
			anf.setApellido(anfDT.getApellido());
			anf.setPass(anfDT.getPass());
			anf.setNombre(anfDT.getNombre());
			anf.setCalificacionGlobal(-1);
			anf.setEstado(anfDT.getEstado());
			anf.setAlojamientos(null);
			// El "save" devuleve el usuario agregado si funciono y lo guardo en aux para devolverlo
			Anfitrion anfR = repoU.save(anf);
			
			return new ResponseEntity<>(anfR, HttpStatus.CREATED);
		} catch (Exception e) {
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}		
	}
	
	@PostMapping("/altaHuesped")
	public ResponseEntity<Huesped> altaHuesped(@RequestBody DtHuesped huesDT) {
		try {
			// Creo usuario para persistir 
			Huesped hue = new Huesped();
			hue.setActivo(huesDT.isActivo());
			hue.setEmail(huesDT.getEmail());
			hue.setApellido(huesDT.getApellido());
			hue.setPass(huesDT.getPass());
			hue.setNombre(huesDT.getNombre());
			hue.setCalificacionGlobal(-1);
			hue.setPushTokens(null);
			hue.setReservas(null);
			// El "save" devuleve el usuario agregado si funciono y lo guardo en aux para devolverlo
			Huesped hueR = repoU.save(hue);
			
			return new ResponseEntity<>(hueR, HttpStatus.CREATED);
		} catch (Exception e) {
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}	
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
					//DtAnfitrion dtanfitrion = new DtAnfitrion(ua.getEmail(),ua.getNombre(), ua.getApellido(),ua.getActivo(), ua.getCalificacionGlobal(), ua.getEstado(),null);
					//retorno.add(dtanfitrion);
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
					//retorno = new DtAnfitrion(user.getEmail(), user.getNombre(), user.getApellido(), user.getActivo(), ua.getCalificacionGlobal(), ua.getEstado(), null);
				}else if (user instanceof Huesped) {
					Huesped uH = (Huesped) user;
					//retorno = new DtHuesped(user.getEmail(), user.getNombre(), user.getApellido(), user.getActivo(), uH.getCalificacionGlobal(),uH.getPushTokens(),null);
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
