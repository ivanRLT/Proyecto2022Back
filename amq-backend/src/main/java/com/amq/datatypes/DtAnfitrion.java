package com.amq.datatypes;

import java.util.ArrayList;
import java.util.List;

import com.amq.enums.AprobacionEstado;

public class DtAnfitrion extends DtUsuario {
	
	private int calificacionGlobal;
	private Boolean bloqueado;
	private AprobacionEstado estado;
	
	
	public DtAnfitrion() {
		super();
		// TODO Auto-generated constructor stub
	}

	public DtAnfitrion(int id, String email, String nombre, String apellido, boolean activo, int calificacionGlobal, AprobacionEstado estado, String tipo, Boolean bloqueado, String jwToken) {
		super(id, email, nombre, apellido, activo, bloqueado,tipo,calificacionGlobal, jwToken);
		this.calificacionGlobal = calificacionGlobal;
		this.estado = estado;
		this.bloqueado = bloqueado;
	}
	public int getCalificacionGlobal() {
		return calificacionGlobal;
	}
	public void setCalificacionGlobal(int calificacionGlobal) {
		this.calificacionGlobal = calificacionGlobal;
	}
	public AprobacionEstado getEstado() {
		return estado;
	}
	public void setEstado(AprobacionEstado estado) {
		this.estado = estado;
	}

	public Boolean getBloqueado() {
		return bloqueado;
	}

	public void setBloqueado(Boolean bloqueado) {
		this.bloqueado = bloqueado;
	}
}
