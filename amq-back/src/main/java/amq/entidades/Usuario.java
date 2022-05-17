package amq.entidades;

import java.util.ArrayList;
import java.util.List;



abstract class Usuario {
	private String email;
	private Boolean activo;
	private String apellido;
	private String nombre;
	//private Recuperacion recuperacion; TODO
	
	public Usuario() {
		super();
	}
	public Usuario(String email, Boolean activo, String apellido, String nombre) {
		this.email = email;
		this.activo = activo;
		this.apellido = apellido;
		this.nombre = nombre;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Boolean getActivo() {
		return activo;
	}
	public void setActivo(Boolean activo) {
		this.activo = activo;
	}
	public String getApellido() {
		return apellido;
	}
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
}

class Administrador extends Usuario{
	public Administrador() {
		super();
	}
	public Administrador(String email, Boolean activo, String apellido, String nombre) {
		super(email, activo, apellido, nombre);
	}
}

class Anfitrion extends Usuario{
	private int calificacionGlobal;
	//private EstadoAprobacion estado; TODO
	private List<Alojamiento> alojamientos = new ArrayList<Alojamiento>();
	
	public Anfitrion() {
		super();
	}
	public Anfitrion(String email, Boolean activo, String apellido, String nombre, int calificacion, List<Alojamiento> alojamientos) {
		super(email, activo, apellido, nombre);
		this.calificacionGlobal = calificacion;
		//this.estado = estado; TODO
		this.alojamientos = alojamientos;
	}
	public int getCalificacionGlobal() {
		return calificacionGlobal;
	}
	public void setCalificacionGlobal(int calificacionGlobal) {
		this.calificacionGlobal = calificacionGlobal;
	}
	// TODO set y get de estado
	public List<Alojamiento> getAlojamientos() {
		return alojamientos;
	}
	public void setAlojamientos(List<Alojamiento> alojamientos) {
		this.alojamientos = alojamientos;
	}
}

class Huesped extends Usuario{
	private int calificacionGlobal;
	private List<String> pushTokens = new ArrayList<String>();
	//private List<Reserva> reservas = new ArrayList<Reserva>(); TODO
	
	public Huesped() {
		super();
	}
	public Huesped(String email, Boolean activo, String apellido, String nombre, int calificacion, List<String> tokens) {
		super(email, activo, apellido, nombre);
		this.calificacionGlobal = calificacion;
		this.pushTokens = tokens;
	}
	public int getCalificacionGlobal() {
		return calificacionGlobal;
	}
	public void setCalificacionGlobal(int calificacionGlobal) {
		this.calificacionGlobal = calificacionGlobal;
	}
	public List<String> getPushTokens() {
		return pushTokens;
	}
	public void setPushTokens(List<String> pushTokens) {
		this.pushTokens = pushTokens;
	}
	// TODO setter y getters reservas
}
