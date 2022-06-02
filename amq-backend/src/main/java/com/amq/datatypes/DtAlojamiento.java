package com.amq.datatypes;

import java.util.List;

import com.amq.model.Habitacion;

public class DtAlojamiento {
	
	private Integer id;
	private Boolean activo;
	private String descripcion;
	private DtDireccion direcion;
	private String nombre;

	public DtAlojamiento(Integer id,Boolean activo, String descripcion, DtDireccion direcion, String nombre ) {
		super();
		this.id = id;
		this.activo = activo;
		this.descripcion = descripcion;
		this.direcion = direcion;
		this.nombre = nombre;
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Boolean getActivo() {
		return activo;
	}

	public Boolean isActivo() {
		return activo;
	}
	
	public void setActivo(Boolean activo) {
		this.activo = activo;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public DtDireccion getDirecion() {
		return direcion;
	}

	public void setDirecion(DtDireccion direcion) {
		this.direcion = direcion;
	}
	
	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
}
