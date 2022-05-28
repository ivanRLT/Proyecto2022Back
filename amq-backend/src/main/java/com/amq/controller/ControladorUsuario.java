package com.amq.controller;

import java.util.ArrayList;

import java.util.List;
import java.util.Locale;
import java.util.Optional;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.core.env.Environment;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.amq.datatypes.DtAdministrador;
import com.amq.datatypes.DtAlojamiento;
import com.amq.datatypes.DtAnfitrion;
import com.amq.datatypes.DtHuesped;
import com.amq.datatypes.DtReserva;
import com.amq.datatypes.DtUsuario;
import com.amq.mail.GenericResponse;
import com.amq.model.Administrador;
import com.amq.model.Anfitrion;
import com.amq.model.Huesped;
import com.amq.model.Usuario;
import com.amq.repositories.RepositoryUsuario;
import com.amq.service.IUsuarioService;
import com.amq.mail.MailSender;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/usuario")
public class ControladorUsuario {
	
	@Autowired
	RepositoryUsuario repoU;
	
	@Autowired
	private IUsuarioService userService;
	
//	 @Autowired
//	 private MailSender mailSender;
	
//	@Autowired
//    private JavaMailSender mailSender;	
	 
	 @Autowired
	 private MessageSource messages;
	
	 @Autowired
	 private Environment env;
	 
	public ControladorUsuario() {
		super();
		// TODO Auto-generated constructor stub
	}

	@RequestMapping(value = "/altaAdmin/{id}", method = { RequestMethod.POST,  RequestMethod.GET })
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
	
	@RequestMapping(value = "/altaAnfitiron/{id}", method = { RequestMethod.POST,  RequestMethod.GET })
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
	
	@RequestMapping(value = "/altaHuesped/{id}", method = { RequestMethod.POST,  RequestMethod.GET })
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
	
	@RequestMapping(value = "/desactivar/{id}", method = { RequestMethod.POST, RequestMethod.GET })
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
	
	@RequestMapping(value = "/bloquear/{id}", method = { RequestMethod.POST, RequestMethod.GET })
	public ResponseEntity<Usuario> bloquearUsuario(@PathVariable("id") int idUsr) {
		try {
			Optional<Usuario> usr = repoU.findById(idUsr);
			Anfitrion anf = null;
			Huesped hue = null;
			if (usr.isPresent()) {
				if (usr.get() instanceof Anfitrion) {
					anf = (Anfitrion) usr.get();
					anf.setBloqueado(true);
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
	
		@RequestMapping(value = "/desbloquear/{id}", method = { RequestMethod.POST, RequestMethod.GET })
		public ResponseEntity<Usuario> desbloquearUsuario(@PathVariable("id") int idUsr) {
			try {
				Optional<Usuario> usr = repoU.findById(idUsr);
				Anfitrion anf = null;
				Huesped hue = null;
				if (usr.isPresent()) {
					if (usr.get() instanceof Anfitrion) {
						anf = (Anfitrion) usr.get();
						anf.setBloqueado(false);
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
		public ResponseEntity<List<DtUsuario>> listarUsuarios() {
			List<Usuario> usuarios = new ArrayList<Usuario>();
			List<DtUsuario> retorno = new ArrayList<DtUsuario>();
			try {
				repoU.findAll().forEach(usuarios::add);
				for (Usuario u : usuarios) {
					if (u instanceof Administrador) {
						DtAdministrador dtadmin = new DtAdministrador(u.getId(), u.getEmail(), u.getNombre(),
								u.getApellido(), u.getActivo(), "Ad");
						retorno.add(dtadmin);
					} else if (u instanceof Anfitrion) {
						Anfitrion ua = (Anfitrion) u;
						DtAnfitrion dtanfitrion = new DtAnfitrion(u.getId(), ua.getEmail(), ua.getNombre(),
								ua.getApellido(), ua.getActivo(), ua.getCalificacionGlobal(), ua.getEstado(), "An");
						retorno.add(dtanfitrion);
					} else if (u instanceof Huesped) {
						Huesped uh = (Huesped) u;
						DtHuesped dthuesped = new DtHuesped(u.getId(), uh.getEmail(), uh.getNombre(), uh.getApellido(),
								uh.getActivo(), uh.getCalificacionGlobal(), uh.getPushTokens(), "Hu");
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
	
		public DtUsuario iniciarSesion(String email, String pass) {
			DtUsuario retorno = null;
			try {
				// Coneccion BD
				Usuario user = null;
				if (user.getPass() == pass) {
					if (user instanceof Administrador) {
						// retorno = new DtAdministrador(user.getEmail(), user.getNombre(),
						// user.getApellido(), user.getActivo());
					} else if (user instanceof Anfitrion) {
						Anfitrion ua = (Anfitrion) user;
						// retorno = new DtAnfitrion(user.getEmail(), user.getNombre(),
						// user.getApellido(), user.getActivo(), ua.getCalificacionGlobal(),
						// ua.getEstado(), null);
					} else if (user instanceof Huesped) {
						Huesped uH = (Huesped) user;
						// retorno = new DtHuesped(user.getEmail(), user.getNombre(),
						// user.getApellido(), user.getActivo(),
						// uH.getCalificacionGlobal(),uH.getPushTokens(),null);
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
	
	@PostMapping("/resetPassword")
	public GenericResponse resetPassword(final HttpServletRequest request, 
	  @RequestParam("email") final String userEmail) {
	    final Usuario user = userService.findUserByEmail(userEmail);
	    if (user != null) {
	    	String token = UUID.randomUUID().toString();
	    	userService.createPasswordResetTokenForUser(user, token);
//	    	mailSender.send(constructResetTokenEmail(getAppUrl(request), 
//	    		      request.getLocale(), token, user));
	    	//mailSender.enviarMail()
	    }
	    return new GenericResponse(
	    		messages.getMessage("message.resetPasswordEmail", null, 
	      request.getLocale()));
	}
	
	private SimpleMailMessage constructResetTokenEmail(final String contextPath, final Locale locale, final String token, final Usuario user) {
        final String url = contextPath + "/usuario/changePassword?token=" + token;
        final String message = messages.getMessage("message.resetPassword", null, locale);
        return constructEmail("Reset Password", message + " \r\n" + url, user);
    }
	
	private SimpleMailMessage constructEmail(String subject, String body, Usuario user) {
        final SimpleMailMessage email = new SimpleMailMessage();
        email.setSubject(subject);
        email.setText(body);
        email.setTo(user.getEmail());
        email.setFrom(env.getProperty("support.email"));
        return email;
    }
	
    private String getAppUrl(HttpServletRequest request) {
        return "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
    }
}
