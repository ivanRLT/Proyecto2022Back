package com.amq.datatypes;

public class DtUsuario {
	private int id;
	private String email;
	private String nombre;
	private String apellido;
	private boolean activo;
	private String pass;
	private String tipo;
	private String jwToken;
	
	public DtUsuario() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DtUsuario(int id, String email, String nombre, String apellido, boolean activo, String tipo, String jwToken) {
		super();
		this.id = id;
		this.email = email;
		this.nombre = nombre;
		this.apellido = apellido;
		this.activo = activo;
		this.tipo = tipo;
		this.jwToken = jwToken;
	}
	
	public String getJwToken() {
		return jwToken;
	}
	
	public void setJwToken(String jwToken) {
		this.jwToken = jwToken;
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public boolean isActivo() {
		return activo;
	}

	public void setActivo(boolean activo) {
		this.activo = activo;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
}
