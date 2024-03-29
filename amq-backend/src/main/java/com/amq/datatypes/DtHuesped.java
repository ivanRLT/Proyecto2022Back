package com.amq.datatypes;

import java.util.List;

public class DtHuesped extends DtUsuario{
	
	
	private Integer calificacionGlobal;
	private Boolean bloqueado;
	private List<String> pushToken;
	private String telefono;
	
	public DtHuesped() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DtHuesped(int id, String email, String nombre, String apellido, boolean activo, 
			Integer calificacionGlobal, List<String> pushToken, String tipo, Boolean bloqueado, String jwToken, String telefono) {
		super(id, email, nombre, apellido, activo, bloqueado, tipo, calificacionGlobal, jwToken );
		this.calificacionGlobal = calificacionGlobal;
		this.pushToken = pushToken;
		this.bloqueado = bloqueado;
		this.telefono = telefono;
	}
	public Integer getCalificacionGlobal() {
		return calificacionGlobal;
	}
	public void setCalificacionGlobal(Integer calificacionGlobal) {
		this.calificacionGlobal = calificacionGlobal;
	}
	public List<String> getPushToken() {
		return pushToken;
	}
	public void setPushToken(List<String> pushToken) {
		this.pushToken = pushToken;
	}
	public Boolean getBloqueado() {
		return bloqueado;
	}
	public void setBloqueado(Boolean bloqueado) {
		this.bloqueado = bloqueado;
	}
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
}
