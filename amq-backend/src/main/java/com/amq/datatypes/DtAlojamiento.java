package com.amq.datatypes;

import java.util.List;

import com.amq.model.Habitacion;

public class DtAlojamiento {
	
	private Integer id;
	private Boolean activo;
	private String descripcion;
	private DtDireccion direcion;
	private String nombre;
	private List<DtHabitacion> habitaciones;
	/**
	 * @param activo
	 * @param descripcion
	 * @param direcion
	 * @param nombre
	 * @param habitaciones
	 */
	public DtAlojamiento(Integer id,Boolean activo, String descripcion, DtDireccion direcion, String nombre, List<DtHabitacion> habitaciones ) {
		super();
		this.id = id;
		this.activo = activo;
		this.descripcion = descripcion;
		this.direcion = direcion;
		this.nombre = nombre;
		this.habitaciones = habitaciones;
	}
	
	
	
	public Integer getId() {
		return id;
	}



	public void setId(Integer id) {
		this.id = id;
	}



	public List<DtHabitacion> getHabitaciones() {
		return habitaciones;
	}



	public void setHabitaciones(List<DtHabitacion> habitaciones) {
		this.habitaciones = habitaciones;
	}



	public Boolean getActivo() {
		return activo;
	}



	/**
	 * @return the activo
	 */
	public Boolean isActivo() {
		return activo;
	}
	/**
	 * @param activo the activo to set
	 */
	public void setActivo(Boolean activo) {
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
	public DtDireccion getDirecion() {
		return direcion;
	}
	/**
	 * @param direcion the direcion to set
	 */
	public void setDirecion(DtDireccion direcion) {
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
}
