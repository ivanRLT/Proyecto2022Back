package com.amq.datatypes;

import java.util.List;

public class DtHuesped extends DtUsuario{
	
	
	private int calificacionGlobal;
	private Boolean bloqueado;
	private List<String> pushToken;
	
	public DtHuesped() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DtHuesped(int id, String email, String nombre, String apellido, boolean activo, int calificacionGlobal, List<String> pushToken, String tipo, Boolean bloqueado, String jwToken) {
		super(id, email, nombre, apellido, activo, bloqueado, tipo, jwToken );
		this.calificacionGlobal = calificacionGlobal;
		this.pushToken = pushToken;
		this.bloqueado = bloqueado;
	}
	public int getCalificacionGlobal() {
		return calificacionGlobal;
	}
	public void setCalificacionGlobal(int calificacionGlobal) {
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
	
	
}
