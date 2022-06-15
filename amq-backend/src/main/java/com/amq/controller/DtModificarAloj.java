package com.amq.controller;

import com.amq.datatypes.DtDireccion;

public class DtModificarAloj {
	private int id;
	private String nombre;
	private String descripcion;
	private DtDireccion direccion;
	
	public DtModificarAloj(int id, String nombre, String descripcion, DtDireccion direccion) {
		super();
		this.id = id;
		this.nombre = nombre;
		this.descripcion = descripcion;
		this.direccion = direccion;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public DtDireccion getDireccion() {
		return direccion;
	}
	public void setDireccion(DtDireccion direccion) {
		this.direccion = direccion;
	}
	
	
	
}
