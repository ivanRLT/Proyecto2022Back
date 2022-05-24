package com.amq.datatypes;

public class DtAlojamiento {
	
	private boolean activo;
	private String descripcion;
	private DtDireccion direcion;
	private String nombre;
	/**
	 * @param activo
	 * @param descripcion
	 * @param direcion
	 * @param nombre
	 */
	public DtAlojamiento(boolean activo, String descripcion, DtDireccion direcion, String nombre) {
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
