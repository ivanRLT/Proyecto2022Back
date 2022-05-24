package com.amq.datatypes;

import java.util.ArrayList;
import java.util.List;

import com.amq.enums.AprobacionEstado;

public class DtAnfitrion extends DtUsuario {
	
	private int calificacionGlobal;
	private AprobacionEstado estado;

	public DtAnfitrion(String email, String nombre, String apellido, boolean activo, int calificacionGlobal, AprobacionEstado estado) {
		super(email, nombre, apellido, activo);
		this.calificacionGlobal = calificacionGlobal;
		this.estado = estado;
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
}
