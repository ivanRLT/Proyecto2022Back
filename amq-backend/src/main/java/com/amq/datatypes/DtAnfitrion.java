package com.amq.datatypes;

import java.util.ArrayList;
import java.util.List;

import com.amq.enums.AprobacionEstado;

public class DtAnfitrion extends DtUsuario {
	
	private int calificacionGlobal;
	private AprobacionEstado estado;

	public DtAnfitrion(int id, String email, String nombre, String apellido, boolean activo, int calificacionGlobal, AprobacionEstado estado, String tipo) {
		super(id, email, nombre, apellido, activo, tipo);
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
