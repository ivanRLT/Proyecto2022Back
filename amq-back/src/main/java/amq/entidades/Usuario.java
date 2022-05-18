package amq.entidades;

import java.util.ArrayList;
import java.util.List;



public abstract class Usuario {
	private int id;
	private String email;
	private Boolean activo;
	private String apellido;
	private String nombre;
	private Recuperacion recuperacion;
	
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
	public Recuperacion getRecuperacion() {
		return recuperacion;
	}
	public void setRecuperacion(Recuperacion recuperacion) {
		this.recuperacion = recuperacion;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
}