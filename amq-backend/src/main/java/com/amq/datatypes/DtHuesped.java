package com.amq.datatypes;

import java.util.List;

public class DtHuesped extends DtUsuario{
	
	
	private int calificacionGlobal;
	private List<String> pushToken;

	public DtHuesped(int id, String email, String nombre, String apellido, boolean activo, int calificacionGlobal, List<String> pushToken, String tipo) {
		super(id, email, nombre, apellido, activo, tipo);
		this.calificacionGlobal = calificacionGlobal;
		this.pushToken = pushToken;
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
}
