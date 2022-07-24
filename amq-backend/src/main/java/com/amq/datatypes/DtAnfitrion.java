package com.amq.datatypes;

import java.util.ArrayList;
import java.util.List;

import com.amq.enums.AprobacionEstado;

public class DtAnfitrion extends DtUsuario {
	
	private Integer calificacionGlobal;
	private Boolean bloqueado;
	private AprobacionEstado estado;
	private String telefono;
	
	
	public DtAnfitrion() {
		super();
		// TODO Auto-generated constructor stub
	}

	public DtAnfitrion(int id, String email, String nombre, String apellido, boolean activo, Integer calificacionGlobal, 
						AprobacionEstado estado, String tipo, Boolean bloqueado, String jwToken, String telefono) {
		super(id, email, nombre, apellido, activo, bloqueado,tipo,calificacionGlobal, jwToken  );
		this.calificacionGlobal = calificacionGlobal;
		this.estado = estado;
		this.bloqueado = bloqueado;
		this.telefono = telefono;
	}
	public Integer getCalificacionGlobal() {
		return calificacionGlobal;
	}
	public void setCalificacionGlobal(Integer calificacionGlobal) {
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
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
}
