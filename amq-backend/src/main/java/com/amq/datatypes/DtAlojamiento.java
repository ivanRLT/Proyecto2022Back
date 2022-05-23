package com.amq.datatypes;

import java.util.ArrayList;
import java.util.List;

public class DtAlojamiento {
	
	private boolean activo;
	private String descripcion;
	private String direcion;
	private String nombre;
	private List<DtHabitacion> habitaciones = new ArrayList<DtHabitacion>();
	/**
	 * @param activo
	 * @param descripcion
	 * @param direcion
	 * @param nombre
	 */
	public DtAlojamiento(boolean activo, String descripcion, String direcion, String nombre) {
		super();
		this.activo = activo;
		this.descripcion = descripcion;
		this.direcion = direcion;
		this.nombre = nombre;
	}
	/**
	 * @return the activo
	 */
	public boolean isActivo() {
		return activo;
	}
	/**
	 * @param activo the activo to set
	 */
	public void setActivo(boolean activo) {
		this.activo = activo;
	}
	/**
	 * @return the descripcion
	 */
	public String getDescripcion() {
		return descripcion;
	}
	/**
	 * @param descripcion the descripcion to set
	 */
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	/**
	 * @return the direcion
	 */
	public String getDirecion() {
		return direcion;
	}
	/**
	 * @param direcion the direcion to set
	 */
	public void setDirecion(String direcion) {
		this.direcion = direcion;
	}
	/**
	 * @return the nombre
	 */
	public String getNombre() {
		return nombre;
	}
	/**
	 * @param nombre the nombre to set
	 */
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public List<DtHabitacion> getHabitaciones() {
		return habitaciones;
	}
	public void setHabitaciones(List<DtHabitacion> habitaciones) {
		this.habitaciones = habitaciones;
	}
}
