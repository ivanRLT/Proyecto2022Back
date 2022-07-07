package com.amq.controller;

import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.amq.datatypes.DtAMQError;
import com.amq.datatypes.DtAdministrador;
import com.amq.datatypes.DtAlojamiento;
import com.amq.datatypes.DtAltaAnfitrion;
import com.amq.datatypes.DtAnfitrion;
import com.amq.datatypes.DtDireccion;
import com.amq.datatypes.DtFiltrosUsuario;
import com.amq.datatypes.DtHabitacion;
import com.amq.datatypes.DtHuesped;
import com.amq.datatypes.DtLogin;
import com.amq.datatypes.DtPassword;
import com.amq.datatypes.DtResetEmail;
import com.amq.datatypes.DtServicios;
import com.amq.datatypes.DtUsuario;
import com.amq.enums.AprobacionEstado;
import com.amq.jwt.JWTGenerador;
import com.amq.model.Administrador;
import com.amq.model.Alojamiento;
import com.amq.model.Anfitrion;
import com.amq.model.Habitacion;
import com.amq.model.Huesped;
import com.amq.model.Reserva;
import com.amq.model.Usuario;
import com.amq.passwordReset.IUsuarioService;
import com.amq.repositories.RepositoryUsuario;
import com.amq.repositories.RepositoryAlojamiento;
import com.amq.repositories.RepositoryCalificacion;
import com.amq.repositories.RepositoryDireccion;
import com.amq.repositories.RepositoryHabitacion;
import com.amq.repositories.RepositoryReserva;
import com.amq.repositories.RepositoryServicios;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/usuario")
public class ControladorUsuario {
	
	private static String HEADER_ERROR="AMQ_ERROR";
	private String msjError=null;
	
	@Autowired
	RepositoryUsuario repoU;
	
	@Autowired
	RepositoryReserva repoR;
	
	@Autowired
	RepositoryHabitacion repoH;
	
	@Autowired
	RepositoryAlojamiento repoA;
	
	@Autowired
	RepositoryServicios repoS;
	
	@Autowired
	RepositoryDireccion repoD;
	
	@Autowired
	RepositoryCalificacion repoC;
	
	
	@Autowired
    private JavaMailSender mailSender;
	
	@Autowired
	private IUsuarioService userService;
	
	 @Autowired
	 private MessageSource messages;
	
//	 @Autowired
//	 private Environment env;
	
	@RequestMapping(value = "/altaAdmin", method = { RequestMethod.POST })
	@PreAuthorize("hasRole('ROLE_AD')")
	public ResponseEntity<?> altaAdministrador(@RequestBody DtAdministrador adminDt) { 
		try {
			Usuario uOpt = repoU.findByEmail(adminDt.getEmail());
			
			if(uOpt!=null) {
				msjError = "Ya existe un usuario con el mail ingresado";
				return new ResponseEntity<>( new DtAMQError(0, msjError), getHeaderError(msjError),  HttpStatus.FOUND);
			}
			
			// Creo usuario para persistir 
			Administrador admin = new Administrador();
			admin.setActivo(adminDt.isActivo());
			admin.setEmail(adminDt.getEmail());
			admin.setApellido(adminDt.getApellido());
			admin.setPass(adminDt.getPass());
			admin.setNombre(adminDt.getNombre());
			// El "save" devuleve el usuario agregado si funciono y lo guardo en aux para devolverlo
			Administrador aminR = repoU.save(admin);
			
			return new ResponseEntity<>(aminR, HttpStatus.OK);
		} catch (Exception e) {
			System.out.println("AMQ ERROR>>>>> "+e.getMessage());
			msjError = "Error desconocido en el servidor";
			return new ResponseEntity<>(new DtAMQError(0, msjError), getHeaderError(msjError),  HttpStatus.INTERNAL_SERVER_ERROR);
		}	
	}
	
	@RequestMapping(value = "/altaAnfitiron", method = { RequestMethod.POST })
	public ResponseEntity<?> altaAnfitrion(@RequestBody DtAltaAnfitrion altaDT) {
		try {
			DtAnfitrion anfDT = altaDT.getAnfitrion();
			DtAlojamiento alojamientodt = altaDT.getAlojamiento();
			DtHabitacion habitaciondt = altaDT.getHabitacion();
			
			Usuario uOpt = repoU.findByEmail(anfDT.getEmail());
			
			if(uOpt!=null) {
				msjError = "Ya existe un usuario con el mail ingresado";
				return new ResponseEntity<>( new DtAMQError(0, msjError), getHeaderError(msjError),  HttpStatus.FOUND);
			}

			Anfitrion anf = new Anfitrion();
			anf.setActivo(anfDT.isActivo());
			anf.setEmail(anfDT.getEmail());
			anf.setApellido(anfDT.getApellido());
			anf.setPass(anfDT.getPass());
			anf.setNombre(anfDT.getNombre());
			anf.setCalificacionGlobal(-1);
			anf.setEstado(anfDT.getEstado());
			anf.setBloqueado(anfDT.getBloqueado());
			List<Alojamiento> alojamientos = new ArrayList<Alojamiento>();
			anf.setAlojamientos(alojamientos);
			
			Anfitrion anfR = repoU.save(anf);

			Alojamiento alojamiento = new Alojamiento();
			DtDireccion direccion = alojamientodt.getDirecion();
			repoD.save(direccion);
			alojamiento.setAnfitrion(anfR);
			alojamiento.setDescripcion(alojamientodt.getDescripcion());
			alojamiento.setDireccion(direccion);
			List<Habitacion> habits = new ArrayList<Habitacion>();
			alojamiento.setHabitaciones(habits);
			alojamiento.setNombre(alojamientodt.getNombre());
			alojamiento.setActivo(false);
			anfR.agregarAlojamiento(alojamiento);
			Alojamiento alojR = repoA.save(alojamiento);
			
			Habitacion hab = new Habitacion();
			DtServicios servicios = habitaciondt.getDtservicios();
			repoS.save(servicios);
			hab.setAlojamiento(alojamiento);
			hab.setCamas(habitaciondt.getCamas());
			hab.setDescripcion(habitaciondt.getDescripcion());
			hab.setPrecioNoche(habitaciondt.getPrecioNoche());
			List<Reserva> reservas = new ArrayList<Reserva>();
			hab.setReservas(reservas);
			hab.setServicios(servicios);
			alojamiento.agregarHabitacion(hab);
			Habitacion habR = repoH.save(hab);
			repoA.save(alojamiento);

			return new ResponseEntity<>(anfR, HttpStatus.OK);
		} catch (Exception e) {
			System.out.println("AMQ ERROR>>>>> "+e.getMessage());
			msjError = "Error desconocido en el servidor";
			return new ResponseEntity<>(new DtAMQError(0, msjError), getHeaderError(msjError), HttpStatus.INTERNAL_SERVER_ERROR);
		}		
	}
	
	@RequestMapping(value = "/altaHuesped", method = { RequestMethod.POST })
	public ResponseEntity<?> altaHuesped(@RequestBody DtHuesped huesDT) {
		try {
			
			Usuario uOpt = repoU.findByEmail(huesDT.getEmail());
			
			if(uOpt!=null) {
				msjError = "Ya existe un usuario con el mail ingresado";
				return new ResponseEntity<>( new DtAMQError(0, msjError), getHeaderError(msjError),  HttpStatus.FOUND);
			}
			
			// Creo usuario para persistir 
			Huesped hue = new Huesped();
			hue.setActivo(huesDT.isActivo());
			hue.setEmail(huesDT.getEmail());
			hue.setApellido(huesDT.getApellido());
			hue.setPass(huesDT.getPass());
			hue.setNombre(huesDT.getNombre());
			hue.setCalificacionGlobal(0);
			hue.setPushTokens(null);
			hue.setReservas(null);
			hue.setBloqueado(false);
			// El "save" devuleve el usuario agregado si funciono y lo guardo en aux para devolverlo
			Huesped hueR = repoU.save(hue);
			
			return new ResponseEntity<>(hueR, HttpStatus.OK);
		} catch (Exception e) {
			System.out.println("AMQ ERROR>>>>> "+e.getMessage());
			msjError = "Error desconocido en el servidor";
			return new ResponseEntity<>(new DtAMQError(0, msjError), getHeaderError(msjError), HttpStatus.INTERNAL_SERVER_ERROR);
		}	
	}
	
	@RequestMapping(value = "/desactivar/{id}", method = { RequestMethod.POST })
	@PreAuthorize("hasRole('ROLE_AD')")
	public ResponseEntity<?> desactivarUsuario(@PathVariable("id") int idUsr) {
		try {
			Optional<Usuario> usr = repoU.findById(idUsr);
			Anfitrion anf = null;
			Huesped hue = null;
			if (usr.isPresent()) {
				if (usr.get() instanceof Anfitrion) {
					anf = (Anfitrion) usr.get();
					anf.setActivo(false);
					return new ResponseEntity<>(repoU.save(anf), HttpStatus.OK);
				}
				if (usr.get() instanceof Huesped) {
					hue = (Huesped) usr.get();
					hue.setActivo(false);
					return new ResponseEntity<>(repoU.save(hue), HttpStatus.OK);
				} else {
					msjError = "El usuario ingresado debe ser de tipo Anfitrión o Huésped.";
					return new ResponseEntity<>( new DtAMQError(0, msjError), getHeaderError(msjError),  HttpStatus.FOUND);
				}
			} else {
				msjError = "No existe un usuario con los datos ingresados.";
				return new ResponseEntity<>( new DtAMQError(0, msjError), getHeaderError(msjError),  HttpStatus.FOUND);
			}
		} catch (Exception e) {
			System.out.println("AMQ ERROR>>>>> "+e.getMessage());
			msjError = "Error desconocido en el servidor.";
			return new ResponseEntity<>(new DtAMQError(0, msjError), getHeaderError(msjError), HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	
	
	@RequestMapping(value = "/bloquear/{id}", method = { RequestMethod.POST })
	@PreAuthorize("hasRole('ROLE_AD')")
	public ResponseEntity<?> bloquearUsuario(@PathVariable("id") int idUsr) {
		try {
			Optional<Usuario> usr = repoU.findById(idUsr);
			Anfitrion anf = null;
			Huesped hue = null;
			if (usr.isPresent()) {
				if (usr.get() instanceof Anfitrion) {
					anf = (Anfitrion) usr.get();
					anf.setBloqueado(true);
					//para cada alojamiento del anfitrion se desactiva
					List<Alojamiento> alojamientosAnfitrion = anf.getAlojamientos();
					for (Alojamiento alanf : alojamientosAnfitrion) {
						alanf.setActivo(false);
					}
					
					return new ResponseEntity<>(repoU.save(anf), HttpStatus.OK);
				}
				if (usr.get() instanceof Huesped) {
					hue = (Huesped) usr.get();
					hue.setBloqueado(true);
					return new ResponseEntity<>(repoU.save(hue), HttpStatus.OK);
				} else {
					msjError = "El usuario ingresado debe ser de tipo Anfitrión o Huésped.";
					return new ResponseEntity<>( new DtAMQError(0, msjError), getHeaderError(msjError),  HttpStatus.FOUND);
				}
			} else {
				msjError = "No existe un usuario con los datos ingresados.";
				return new ResponseEntity<>( new DtAMQError(0, msjError), getHeaderError(msjError),  HttpStatus.FOUND);
			}
		} catch (Exception e) {
			System.out.println("AMQ ERROR>>>>> "+e.getMessage());
			msjError = "Error desconocido en el servidor";
			return new ResponseEntity<>(new DtAMQError(0, msjError), getHeaderError(msjError), HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@RequestMapping(value = "/desbloquear/{id}", method = { RequestMethod.POST })
	@PreAuthorize("hasRole('ROLE_AD')")
	public ResponseEntity<?> desbloquearUsuario(@PathVariable("id") int idUsr) {
		try {
			Optional<Usuario> usr = repoU.findById(idUsr);
			Anfitrion anf = null;
			Huesped hue = null;
			if (usr.isPresent()) {
				if (usr.get() instanceof Anfitrion) {
					anf = (Anfitrion) usr.get();
					anf.setBloqueado(false);
					//Para cada alojamiento del anfitrion se activan.
					List<Alojamiento> alojamientosAnfitrion = anf.getAlojamientos();
					for (Alojamiento alanf : alojamientosAnfitrion) {
						alanf.setActivo(true);
					}
					
					return new ResponseEntity<>(repoU.save(anf), HttpStatus.OK);
				}
				if (usr.get() instanceof Huesped) {
					hue = (Huesped) usr.get();
					hue.setBloqueado(false);
					return new ResponseEntity<>(repoU.save(hue), HttpStatus.OK);
				} else {
					msjError = "El usuario ingresado debe ser de tipo Anfitrión o Huésped.";
					return new ResponseEntity<>( new DtAMQError(0, msjError), getHeaderError(msjError),  HttpStatus.FOUND);
				}
			} else {
				msjError = "No existe un usuario con los datos ingresados.";
				return new ResponseEntity<>( new DtAMQError(0, msjError), getHeaderError(msjError),  HttpStatus.FOUND);
			}
		} catch (Exception e) {
			System.out.println("AMQ ERROR>>>>> "+e.getMessage());
			msjError = "Error desconocido en el servidor";
			return new ResponseEntity<>(new DtAMQError(0, msjError), getHeaderError(msjError), HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@RequestMapping(value = "/listar", method = { RequestMethod.POST })
	//@PreAuthorize("hasRole('ROLE_AD')")
	public ResponseEntity<?> listarUsuarios(@RequestBody DtFiltrosUsuario filtros) {
		List<Usuario> usuarios = new ArrayList<Usuario>();
		List<DtUsuario> retorno = new ArrayList<DtUsuario>();
		try {
			repoU.findAll().forEach(usuarios::add);
			for (Usuario u : usuarios) {
				if( usuarioCumpleFiltros(u, filtros) ) {
					if (u instanceof Administrador) {
						DtAdministrador dtadmin = new DtAdministrador(u.getId(), u.getEmail(), u.getNombre(),
								u.getApellido(), u.getActivo(), "Ad", u.getBloqueado(), null);
						
						retorno.add(dtadmin);
					} else if (u instanceof Anfitrion) {
						Anfitrion ua = (Anfitrion) u;
						DtAnfitrion dtanfitrion = new DtAnfitrion(u.getId(), ua.getEmail(), ua.getNombre(),
								ua.getApellido(), ua.getActivo(), ua.getCalificacionGlobal(), ua.getEstado(),  "An", ua.getBloqueado(), null);
						retorno.add(dtanfitrion);
					} else if (u instanceof Huesped) {
						Huesped uh = (Huesped) u;
						DtHuesped dthuesped = new DtHuesped( u.getId(), uh.getEmail(), uh.getNombre(), uh.getApellido(),
								uh.getActivo(), uh.getCalificacionGlobal(), uh.getPushTokens(), "Hu", uh.getBloqueado(), null, uh.getTelefono());
						retorno.add(dthuesped);
					}
				}
			}
			if (retorno.isEmpty()) {
				msjError = "No se encontraron usuarios.";
				return new ResponseEntity<>( new DtAMQError(0, msjError), getHeaderError(msjError),  HttpStatus.NOT_FOUND);
			} else {
				return new ResponseEntity<>(retorno, HttpStatus.OK);
			}
		} catch (Exception e) {
			System.out.println("AMQ ERROR>>>>> "+e.getMessage());
			msjError = "Error desconocido en el servidor";
			return new ResponseEntity<>(new DtAMQError(0, msjError), getHeaderError(msjError), HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@RequestMapping(value = "/aprobarAnfitrion/{id}", method = { RequestMethod.GET })
	@PreAuthorize("hasRole('ROLE_AD')")
	public ResponseEntity<?> aprobarAnfitrion(@PathVariable("id") int idUsr) {
		try {
			Optional<Usuario> usr = repoU.findById(idUsr);
			Anfitrion anf = null;
			if (usr.isPresent()) {
				if (!(usr.get() instanceof Anfitrion) ) {
					msjError = "El usuario ingresado debe ser de tipo Anfitrión.";
					return new ResponseEntity<>( new DtAMQError(0, msjError), getHeaderError(msjError),  HttpStatus.BAD_REQUEST);
				}
				anf = (Anfitrion) usr.get();
				for(Alojamiento aloj : anf.getAlojamientos()) {
					aloj.setActivo(true);
				}
				anf.setEstado(AprobacionEstado.APROBADO);
				repoU.save(anf);
				return new ResponseEntity<>(anf, HttpStatus.OK);
			} else {
				msjError = "El usuario ingresado debe ser de tipo Anfitrión.";
				return new ResponseEntity<>( new DtAMQError(0, msjError), getHeaderError(msjError),  HttpStatus.BAD_REQUEST);
			}

		} catch (Exception e) {
			System.out.println("AMQ ERROR>>>>> "+e.getMessage());
			msjError = "Error desconocido en el servidor";
			return new ResponseEntity<>(new DtAMQError(0, msjError), getHeaderError(msjError), HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@RequestMapping(value = "/rechazarAnfitrion/{id}", method = { RequestMethod.GET })
	@PreAuthorize("hasRole('ROLE_AD')")
	public ResponseEntity<?> rechazarAnfitrion(@PathVariable("id") int idUsr) {
		try {
			Optional<Usuario> usr = repoU.findById(idUsr);
			Anfitrion anf = null;
			if (usr.isPresent()) {
				if (!(usr.get() instanceof Anfitrion) ) {
					return new ResponseEntity<>( HttpStatus.BAD_REQUEST );
				}
				
				anf = (Anfitrion) usr.get();
				for(Alojamiento aloj : anf.getAlojamientos()) {
					aloj.setActivo(false);
				}
				anf.setEstado(AprobacionEstado.RECHAZADO);
				repoU.save(anf);
				return new ResponseEntity<>(anf, HttpStatus.OK);
			} else {
				msjError = "No existe un usuario con los datos ingresados.";
				return new ResponseEntity<>( new DtAMQError(0, msjError), getHeaderError(msjError), HttpStatus.NOT_ACCEPTABLE);
			}

		} catch (Exception e) {
			System.out.println("AMQ ERROR>>>>> "+e.getMessage());
			msjError = "Error desconocido en el servidor";
			return new ResponseEntity<>(new DtAMQError(0, msjError), getHeaderError(msjError), HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@RequestMapping(value = "/login", method = { RequestMethod.POST })
	public ResponseEntity<?> iniciarSesion(@RequestBody DtLogin dtLogin) {
		Usuario user;
		DtUsuario dtUser = new DtUsuario();
		String email = dtLogin.getEmail();
		String pass = dtLogin.getPass();
		String msjError="";
		
		try {
			user = repoU.findByEmail(email);
			
			if(user == null || !user.getPass().equals(pass) ) {
				msjError = "Mail y/o contraseñas incorrectos.";
				return new ResponseEntity<>(new DtAMQError(0, msjError), getHeaderError(msjError), HttpStatus.NOT_FOUND);
			}
			
			if(user.getActivo().equals(false) ) {
				msjError = "El usuario ingresado fué dado de baja.";
				return new ResponseEntity<>(new DtAMQError(0, msjError), getHeaderError(msjError), HttpStatus.NOT_FOUND);
			}
			
			if(user.getBloqueado().equals(true) ) {
				msjError = "El usuario ingresado se encuentra bloqueado.";
				return new ResponseEntity<>(new DtAMQError(0, msjError), getHeaderError(msjError), HttpStatus.NOT_FOUND);
			}
			
			if( 	user instanceof Anfitrion &&  
					((Anfitrion)user).getEstado()!= AprobacionEstado.APROBADO 
			){
				msjError = "El usuario ingresado se encuentra en estado "+((Anfitrion)user).getEstado().toString()+".";
				return new ResponseEntity<>(new DtAMQError(0, msjError), getHeaderError(msjError), HttpStatus.NOT_ACCEPTABLE);
			}
			
			String jwToken = JWTGenerador.getJWTToken(user);
			
			if (user instanceof Administrador) {
				dtUser = new DtAdministrador( user.getId(), user.getEmail(), user.getNombre(),
				 user.getApellido(), user.getActivo(), "Ad", user.getBloqueado(), jwToken);
			} else if (user instanceof Anfitrion) {
				Anfitrion ua = (Anfitrion) user;
				dtUser = new DtAnfitrion(user.getId(), user.getEmail(), user.getNombre(),
						user.getApellido(), user.getActivo(),  ua.getCalificacionGlobal(),
						ua.getEstado(), "An",null, jwToken);
			} else if (user instanceof Huesped) {
				Huesped uH = (Huesped) user;
				dtUser = new DtHuesped(user.getId(), user.getEmail(), user.getNombre(),
						user.getApellido(), user.getActivo(), 
						uH.getCalificacionGlobal(),uH.getPushTokens(), "Hu", null, jwToken, uH.getTelefono() );

				
				List<String> pushToks = uH.getPushTokens();
				Boolean existeToken = false;
				for(String push : pushToks) {
					if( push.equals(dtLogin.getPushToken()) ) {
						existeToken = true;
					}
				}
				if( !existeToken ) {
					uH.getPushTokens().add(dtLogin.getPushToken());
					repoU.save( uH );
				};
				
			}
			
			return new ResponseEntity<>(dtUser, HttpStatus.OK);
		} catch (Exception e) {
			System.out.println("AMQ ERROR>>>>> "+e.getMessage());
			msjError = "Error desconocido en el servidor.";
			return new ResponseEntity<>(new DtAMQError(0, msjError), getHeaderError(msjError), HttpStatus.INTERNAL_SERVER_ERROR);
		}


	}
	
	
	@RequestMapping(value = "/resetPassword", method = { RequestMethod.POST })
	public ResponseEntity<?> resetPassword(@RequestBody DtResetEmail dtemail) {

		Usuario user;
		String email = dtemail.getEmail();

		try {
			user = repoU.findByEmail(email);
			if (user != null) {
				String token = UUID.randomUUID().toString();
				userService.createPasswordResetTokenForUser(user, token);
				mailSender.send(constructResetTokenEmail(token, user));
				return new ResponseEntity<>(HttpStatus.OK);
			}
			msjError = "Mail  incorrecto.";
			return new ResponseEntity<>(new DtAMQError(0, msjError), getHeaderError(msjError), HttpStatus.NOT_FOUND);
		} catch (Exception e) {
			System.out.println("AMQ ERROR>>>>> "+e.getMessage());
			msjError = "Error desconocido en el servidor";
			return new ResponseEntity<>(new DtAMQError(0, msjError), getHeaderError(msjError), HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@RequestMapping(value = "/savePassword", method = { RequestMethod.POST })
	public ResponseEntity<?> savePassword(@RequestBody DtPassword dtPassword) {

		Usuario user;

		try {

			String result = userService.validatePasswordResetToken(dtPassword.getToken());

			if (result != null) {
				msjError = "Token inválido.";
				return new ResponseEntity<>(new DtAMQError(0, msjError), getHeaderError(msjError), HttpStatus.NOT_FOUND);
			}

			user = userService.getUserByPassResetToken(dtPassword.getToken());

			if (user != null) {
				userService.changeUserPassword(user, dtPassword.getNewPassword());
				return new ResponseEntity<>(HttpStatus.OK);
			}
			msjError = "Mail incorrecto.";
			return new ResponseEntity<>(new DtAMQError(0, msjError), getHeaderError(msjError), HttpStatus.NOT_FOUND);
		} catch (Exception e) {
			System.out.println("AMQ ERROR>>>>> "+e.getMessage());
			msjError = "Error desconocido en el servidor";
			return new ResponseEntity<>(new DtAMQError(0, msjError), getHeaderError(msjError), HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	
	@RequestMapping(value = "/buscar/{id}", method = { RequestMethod.POST })
	@PreAuthorize("hasRole('ROLE_HU')")
	public ResponseEntity<?> buscarUsuario( @PathVariable("id") int id ) {
		Usuario user;
		DtUsuario dtUser = null;
		
		try {
			Optional<Usuario>  optUsr= repoU.findById(id);
			
			if(optUsr.isEmpty()) {
				msjError = "No existe un usuario con los datos ingresados.";
				return new ResponseEntity<>( new DtAMQError(0, msjError), getHeaderError(msjError),  HttpStatus.FOUND);
			}
			
			user = optUsr.get();
			
			if (user instanceof Administrador) {
				dtUser = new DtAdministrador( user.getId(), user.getEmail(), user.getNombre(),
				 user.getApellido(), user.getActivo(), "Ad", user.getBloqueado(), null );
			} else if (user instanceof Anfitrion) {
				Anfitrion ua = (Anfitrion) user;
				dtUser = new DtAnfitrion(user.getId(), user.getEmail(), user.getNombre(),
						user.getApellido(), user.getActivo(),  ua.getCalificacionGlobal(),
						ua.getEstado(), "An",null, null );
			} else if (user instanceof Huesped) {
				Huesped uH = (Huesped) user;
				dtUser = new DtHuesped(user.getId(), user.getEmail(), user.getNombre(),
						user.getApellido(), user.getActivo(), 
						uH.getCalificacionGlobal(),uH.getPushTokens(), "Hu", null, null, uH.getTelefono() );
			}
			
			return new ResponseEntity<>(dtUser, HttpStatus.OK);
		} catch (Exception e) {
			System.out.println("AMQ ERROR>>>>> "+e.getMessage());
			msjError = "Error desconocido en el servidor";
			return new ResponseEntity<>(new DtAMQError(0, msjError), getHeaderError(msjError), HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@RequestMapping(value = "/esValidoTokenHuesped", method = { RequestMethod.GET })
	@PreAuthorize("hasRole('ROLE_HU')")
	public ResponseEntity<?> esValidoTokenHuesped( ) {
		return new ResponseEntity<>(new DtAMQError(0, "OK"), getHeaderError(msjError), HttpStatus.OK);
	}
	
	/*########################### FUNCIONES AUXILIARES ###########################*/ 

	private SimpleMailMessage constructResetTokenEmail( String token, Usuario user) {
		 String url = token;
         String message = messages.getMessage("message.resetPassword", null, null);
        return constructEmail("Reset Password  - Aquí me Quedo", message + " \r\n" + url, user);
    }
	
	private SimpleMailMessage constructEmail(String subject, String body, Usuario user) {
        SimpleMailMessage email = new SimpleMailMessage();
        email.setSubject(subject);
        email.setText(body);
        email.setTo(user.getEmail());
        email.setFrom(user.getEmail());
        return email;
    }

    
    private Boolean usuarioCumpleFiltros(Usuario usr, DtFiltrosUsuario filtros) {
    	if(usr==null) {
    		return false;
    	}
    	if( filtros.getActivo()!=null && !usr.getActivo().equals(filtros.getActivo()) ) {
    		return false;
    	}
    	
    	//Si es administrador y tiene definido un usuario un filtro de Anfitrion o Huesped 
    	if(  usr instanceof Administrador && (
    				filtros.getCalificacion_desde()!=null ||
    				filtros.getCalificacion_hasta()!=null ||
    				filtros.getBloqueado()!=null
    			) 
    	){
    		return false;
    	}else {
        	//Filtros de Huesped y Anfitrion
	    	if( filtros.getBloqueado()!=null && usr instanceof Huesped && !((Huesped)usr).getBloqueado().equals(filtros.getBloqueado())){
	    		return false;
	    	}
	    	if( filtros.getBloqueado()!=null && usr instanceof Anfitrion && !((Anfitrion)usr).getBloqueado().equals(filtros.getBloqueado())){
	    		return false;
	    	}
	    	if( filtros.getCalificacion_desde()!=null && usr instanceof Huesped 
	    			&& ((Huesped)usr).getCalificacionGlobal().intValue()<filtros.getCalificacion_desde().intValue() ) {
	    		return false;
	    	}
	    	if( filtros.getCalificacion_desde()!=null && usr instanceof Anfitrion 
	    			&& ((Anfitrion)usr).getCalificacionGlobal().intValue()<filtros.getCalificacion_desde().intValue() ) {
	    		return false;
	    	}
	    	if( filtros.getCalificacion_hasta()!=null && usr instanceof Huesped 
	    			&& ((Huesped)usr).getCalificacionGlobal().intValue()>filtros.getCalificacion_hasta().intValue() ) {
	    		return false;
	    	}
	    	if( filtros.getCalificacion_hasta()!=null && usr instanceof Anfitrion 
	    			&& ((Anfitrion)usr).getCalificacionGlobal().intValue()>filtros.getCalificacion_hasta().intValue() ) {
	    		return false;
	    	}
    	}
    	if( filtros.getTipo()!=null && filtros.getTipo().equals("Hu") && !(usr instanceof Huesped)  ) {
    		return false;
    	}
    	if( filtros.getTipo()!=null && filtros.getTipo().equals("An") && !(usr instanceof Anfitrion)  ) {
    		return false;
    	}
    	if( filtros.getTipo()!=null && filtros.getTipo().equals("Ad") && !(usr instanceof Administrador)  ) {
    		return false;
    	}
    	if(!(usr instanceof Anfitrion) &&  filtros.getEstado()!=null) {
    		return false; 
    	}
    	if( filtros.getEstado()!=null && !filtros.getEstado().equals(((Anfitrion)usr).getEstado().toString())){
    			return false;
    	}
    	
    	return true;
    }
    
    private HttpHeaders getHeaderError( String error ) {
		HttpHeaders responseHeaders = new HttpHeaders();
	   responseHeaders.set(HEADER_ERROR, error);
	   return responseHeaders;
	}
}

