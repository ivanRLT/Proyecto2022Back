package com.amq.controller;

import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Optional;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.threeten.bp.LocalDate;

import com.amq.datatypes.DtAdministrador;
import com.amq.datatypes.DtAlojamiento;
import com.amq.datatypes.DtAltaAnfitrion;
import com.amq.datatypes.DtAnfitrion;
import com.amq.datatypes.DtDireccion;
import com.amq.datatypes.DtEnviarCalificacion;
import com.amq.datatypes.DtFecha;
import com.amq.datatypes.DtHabitacion;
import com.amq.datatypes.DtHuesped;
import com.amq.datatypes.DtReserva;
import com.amq.datatypes.DtServicios;
import com.amq.datatypes.DtUsuario;
import com.amq.enums.AprobacionEstado;
import com.amq.enums.ReservaEstado;
import com.amq.jwt.JWTGenerador;
import com.amq.mail.GenericResponse;
import com.amq.model.Administrador;
import com.amq.model.Alojamiento;
import com.amq.model.Anfitrion;
import com.amq.model.Calificacion;
import com.amq.model.Habitacion;
import com.amq.model.Huesped;
import com.amq.model.Reserva;
import com.amq.model.Usuario;
import com.amq.repositories.RepositoryUsuario;
import com.amq.repositories.RepositoryAlojamiento;
import com.amq.repositories.RepositoryCalificacion;
import com.amq.repositories.RepositoryDireccion;
import com.amq.repositories.RepositoryHabitacion;
import com.amq.repositories.RepositoryReserva;
import com.amq.repositories.RepositoryServicios;
import com.amq.service.IUsuarioService;
import com.amq.dto.PasswordDto;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/usuario")
public class ControladorUsuario {
	
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
	
	@RequestMapping(value = "/altaAnfitiron", method = { RequestMethod.POST })
	public ResponseEntity<Anfitrion> altaAnfitrion(@RequestBody DtAltaAnfitrion altaDT) {
		try {
			DtAnfitrion anfDT = altaDT.getAnfitrion();
			DtAlojamiento alojamientodt = altaDT.getAlojamiento();
			DtHabitacion habitaciondt = altaDT.getHabitacion();

			Anfitrion anf = new Anfitrion();
			anf.setActivo(anfDT.isActivo());
			anf.setEmail(anfDT.getEmail());
			anf.setApellido(anfDT.getApellido());
			anf.setPass(anfDT.getPass());
			anf.setNombre(anfDT.getNombre());
			anf.setCalificacionGlobal(-1);
			anf.setEstado(anfDT.getEstado());
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

			return new ResponseEntity<>(anfR, HttpStatus.CREATED);
		} catch (Exception e) {
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}		
	}
	
	@RequestMapping(value = "/altaHuesped", method = { RequestMethod.POST })
	public ResponseEntity<Huesped> altaHuesped(@RequestBody DtHuesped huesDT) {
		try {
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
	
	@RequestMapping(value = "/desactivar/{id}", method = { RequestMethod.POST })
	public ResponseEntity<Usuario> desactivarUsuario(@PathVariable("id") int idUsr) {
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
					return new ResponseEntity<>(HttpStatus.NOT_ACCEPTABLE);
				}
			} else {
				return new ResponseEntity<>(HttpStatus.NOT_FOUND);
			}
		} catch (Exception e) {
			System.out.println(e.toString());
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@RequestMapping(value = "/calificar", method = { RequestMethod.POST })
    public ResponseEntity<String> calificar(@RequestBody DtEnviarCalificacion dtEnvCal) {
		Calificacion cal;
		
		if( dtEnvCal.getCalificacion()==null && dtEnvCal.getResena()==null) {
			return new ResponseEntity<>(HttpStatus.NOT_ACCEPTABLE);
		}
		
    	try {
    		Optional<Reserva> optRes = repoR.findById(dtEnvCal.getIdReserva()); 
    		Optional<Usuario> optUsr = repoU.findById(dtEnvCal.getIdUsuario());
    		
    		if( optRes.get().getCalificacion()==null) {
    			cal = new Calificacion( 0 ,0, 0 , null, new DtFecha(0, 0, 0));
    			repoC.save(cal);
    			optRes.get().setCalificacion( cal );
    		}
    		else {
    			cal = optRes.get().getCalificacion();
    		}

    		if(optUsr.get() instanceof Huesped) {
    			cal.setCalificacionHuesped(dtEnvCal.getCalificacion());
    		}
    		else if(optUsr.get() instanceof Anfitrion) {
    			if(dtEnvCal.getCalificacion()!=null) {
    				cal.setCalificacionAnfitrion(dtEnvCal.getCalificacion());
    			}
    			if( dtEnvCal.getResena()!=null ) {
    				cal.setResena(dtEnvCal.getResena());
    				LocalDate hoy = LocalDate.now();
					DtFecha dtFecha = new DtFecha( hoy.getDayOfMonth() , hoy.getMonthValue()-1, hoy.getYear());
    				cal.setFechaResena(dtFecha);
    			}
    		}
    		
    		repoC.save(cal);
    		repoU.save(optUsr.get());
    		recalcularCalificacionGlobal(dtEnvCal.getIdUsuario());
    		return new ResponseEntity<>(HttpStatus.OK);
    	}
    	catch(Exception e) {
    		return new ResponseEntity<>(e.getMessage(),HttpStatus.INTERNAL_SERVER_ERROR);
    	}
    }
	
	@RequestMapping(value = "/bloquear/{id}", method = { RequestMethod.POST })
	public ResponseEntity<Usuario> bloquearUsuario(@PathVariable("id") int idUsr) {
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
					return new ResponseEntity<>(HttpStatus.NOT_ACCEPTABLE);
				}
			} else {
				return new ResponseEntity<>(HttpStatus.NOT_FOUND);
			}
		} catch (Exception e) {
			System.out.println(e.toString());
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
		@RequestMapping(value = "/desbloquear/{id}", method = { RequestMethod.POST })
		public ResponseEntity<Usuario> desbloquearUsuario(@PathVariable("id") int idUsr) {
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
						return new ResponseEntity<>(HttpStatus.NOT_ACCEPTABLE);
					}
				} else {
					return new ResponseEntity<>(HttpStatus.NOT_FOUND);
				}
			} catch (Exception e) {
				System.out.println(e.toString());
				return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
		}
		@RequestMapping(value = "/listar", method = { RequestMethod.POST, RequestMethod.GET })
		//@PreAuthorize("hasRole('ROLE_AD')")
		public ResponseEntity<List<DtUsuario>> listarUsuarios() {
			List<Usuario> usuarios = new ArrayList<Usuario>();
			List<DtUsuario> retorno = new ArrayList<DtUsuario>();
			try {
				repoU.findAll().forEach(usuarios::add);
				for (Usuario u : usuarios) {
					if (u instanceof Administrador) {
						DtAdministrador dtadmin = new DtAdministrador(u.getId(), u.getEmail(), u.getNombre(),
								u.getApellido(), u.getActivo(), "Ad", null);
						retorno.add(dtadmin);
					} else if (u instanceof Anfitrion) {
						Anfitrion ua = (Anfitrion) u;
						DtAnfitrion dtanfitrion = new DtAnfitrion(u.getId(), ua.getEmail(), ua.getNombre(),
								ua.getApellido(), ua.getActivo(), ua.getCalificacionGlobal(), ua.getEstado(),  "An", ua.getBloqueado(), null);
						retorno.add(dtanfitrion);
					} else if (u instanceof Huesped) {
						Huesped uh = (Huesped) u;
						DtHuesped dthuesped = new DtHuesped( u.getId(), uh.getEmail(), uh.getNombre(), uh.getApellido(),
								uh.getActivo(), uh.getCalificacionGlobal(), uh.getPushTokens(), "Hu", uh.getBloqueado(), null);
						retorno.add(dthuesped);
					}
				}
				if (retorno.isEmpty()) {
					return new ResponseEntity<>(HttpStatus.NO_CONTENT);
				} else {
					return new ResponseEntity<>(retorno, HttpStatus.OK);
				}
			} catch (Exception e) {
				return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
			}
		}
		
		@RequestMapping(value = "/aprobarAnfitrion/{id}", method = { RequestMethod.POST })
		public ResponseEntity<Usuario> aprobarAnfitrion(@PathVariable("id") int idUsr) {
			try {
				Optional<Usuario> usr = repoU.findById(idUsr);
				Anfitrion anf = null;
				if (usr.isPresent()) {
					if (usr.get() instanceof Anfitrion) {
						anf = (Anfitrion) usr.get();
						anf.setEstado(AprobacionEstado.APROBADO);
					}
					return new ResponseEntity<>(repoU.save(anf), HttpStatus.OK);
				} else {
					return new ResponseEntity<>(HttpStatus.NOT_ACCEPTABLE);
				}

			} catch (Exception e) {
				return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
		}
		
		@RequestMapping(value = "/rechazarAnfitrion/{id}", method = { RequestMethod.POST })
		public ResponseEntity<Usuario> rechazarAnfitrion(@PathVariable("id") int idUsr) {
			try {
				Optional<Usuario> usr = repoU.findById(idUsr);
				Anfitrion anf = null;
				if (usr.isPresent()) {
					if (usr.get() instanceof Anfitrion) {
						anf = (Anfitrion) usr.get();
						anf.setEstado(AprobacionEstado.RECHAZADO);
					}
					return new ResponseEntity<>(repoU.save(anf), HttpStatus.OK);
				} else {
					return new ResponseEntity<>(HttpStatus.NOT_ACCEPTABLE);
				}

			} catch (Exception e) {
				return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
		}
		
		@RequestMapping(value = "/login", method = { RequestMethod.POST })
		public ResponseEntity<DtUsuario> iniciarSesion(@RequestBody DtUsuario dtMailPass) {
			Usuario user;
			DtUsuario dtUser = null;
			String email = dtMailPass.getEmail();
			String pass = dtMailPass.getPass();
			
			try {
				user = repoU.findByEmail(email);
				
				if(user == null || !user.getPass().equals(pass) ) {
					return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
				}
				
				String jwToken = JWTGenerador.getJWTToken(user);
				
				if (user instanceof Administrador) {
					dtUser = new DtAdministrador( user.getId(), user.getEmail(), user.getNombre(),
					 user.getApellido(), user.getActivo(), "Ad", jwToken);
				} else if (user instanceof Anfitrion) {
					Anfitrion ua = (Anfitrion) user;
					dtUser = new DtAnfitrion(user.getId(), user.getEmail(), user.getNombre(),
							user.getApellido(), user.getActivo(),  ua.getCalificacionGlobal(),
							ua.getEstado(), "An",null, jwToken);
				} else if (user instanceof Huesped) {
					Huesped uH = (Huesped) user;
					dtUser = new DtHuesped(user.getId(), user.getEmail(), user.getNombre(),
							user.getApellido(), user.getActivo(), 
							uH.getCalificacionGlobal(),uH.getPushTokens(), "Hu", null, jwToken);
				}
				
				return new ResponseEntity<>(dtUser, HttpStatus.FOUND);
			} catch (Exception e) {
				return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
			}


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
	
	
	
	@PostMapping("/resetPassword")
	public GenericResponse resetPassword( HttpServletRequest request, 
			@RequestParam("email") String userEmail) {
	    Usuario user = userService.findUserByEmail(userEmail);
	    if (user != null) {
	    	String token = UUID.randomUUID().toString();
	    	userService.createPasswordResetTokenForUser(user, token);
	    	mailSender.send(constructResetTokenEmail(getAppUrl(request),request.getLocale(), token, user));
	    }
	    return new GenericResponse(messages.getMessage("message.resetPasswordEmail", null, request.getLocale()));
	}
	
	// Save password
	@PostMapping("/savePassword")
	public GenericResponse savePassword(final Locale locale, @Valid PasswordDto passwordDto) {
		String result = userService.validatePasswordResetToken(passwordDto.getToken());

		if (result != null) {
			return new GenericResponse(messages.getMessage("auth.message." + result, null, locale));
		}
		
		Optional<Usuario> user = userService.getUserByPasswordResetToken(passwordDto.getToken());
		if (user.isPresent()) {
			userService.changeUserPassword(user.get(), passwordDto.getNewPassword());
			return new GenericResponse(messages.getMessage("message.resetPasswordSuc", null, locale));
		} else {
			return new GenericResponse(messages.getMessage("auth.message.invalid", null, locale));
		}
		
	}

	private SimpleMailMessage constructResetTokenEmail(String contextPath, Locale locale, String token, Usuario user) {
		 String url = contextPath + "/usuario/changePassword?token=" + token;
         String message = messages.getMessage("message.resetPassword", null, locale);
        return constructEmail("Reset Password  - Aquí me Quedo", message + " \r\n" + url, user);
    }
	
	private SimpleMailMessage constructEmail(String subject, String body, Usuario user) {
        SimpleMailMessage email = new SimpleMailMessage();
        email.setSubject(subject);
        email.setText(body);
        email.setTo(user.getEmail());
//        email.setFrom(env.getProperty("support.email"));
        email.setFrom(user.getEmail());
        return email;
    }

    private String getAppUrl(HttpServletRequest request) {
        return "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
    }
    
    private void recalcularCalificacionGlobal(int id) throws Exception{
    	int calificacionGlobal=0;
    	Optional<Usuario> optUsr = repoU.findById(id);
    	Usuario usr = optUsr.get();
    	if(usr instanceof Anfitrion ) {
    		Anfitrion anf = (Anfitrion) usr;
    		List<Alojamiento> alojs= anf.getAlojamientos();
    		for(Alojamiento a : alojs) {
    			List<Habitacion> habs = a.getHabitaciones();
    			for(Habitacion hab : habs) {
    				List<Reserva> ress = hab.getReservas();
    				for(Reserva res : ress) {
    					if( res.getCalificacion()!=null ) {
    						calificacionGlobal += res.getCalificacion().getCalificacionAnfitrion();
    					}
    				}
    			}
    		}
    		anf.setCalificacionGlobal(calificacionGlobal);
    	}
    	if(usr instanceof Huesped) {
    		Huesped hu = (Huesped) usr;
			List<Reserva> ress = hu.getReservas();
			for(Reserva res : ress) {
				if( res.getCalificacion()!=null ) {
					calificacionGlobal += res.getCalificacion().getCalificacionHuesped();
				}
			}
			hu.setCalificacionGlobal(calificacionGlobal);
    	}
    	repoU.save(usr);
    }
}

