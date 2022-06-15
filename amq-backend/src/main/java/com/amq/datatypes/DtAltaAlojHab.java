package com.amq.datatypes;

public class DtAltaAlojHab {
	
	private int idAnfitrion;
	
	private String aloj_descripcion;
	private DtDireccion aloj_direcion;
	private String aloj_nombre;
	
	private String hab_descripcion;
	private Double hab_precioNoche;
	private int hab_camas;
	private DtServicios hab_dtservicios;
	
	
	
	public DtAltaAlojHab(int idAnfitrion, String aloj_descripcion, DtDireccion aloj_direcion, String aloj_nombre, String hab_descripcion,
			Double hab_precioNoche, int hab_camas, DtServicios hab_dtservicios) {
		super();
		this.idAnfitrion = idAnfitrion;
		this.aloj_descripcion = aloj_descripcion;
		this.aloj_direcion = aloj_direcion;
		this.aloj_nombre = aloj_nombre;
		this.hab_descripcion = hab_descripcion;
		this.hab_precioNoche = hab_precioNoche;
		this.hab_camas = hab_camas;
		this.hab_dtservicios = hab_dtservicios;
	}
	
	public int getIdAnfitrion() {
		return idAnfitrion;
	}

	public void setIdAnfitrion(int idAnfitrion) {
		this.idAnfitrion = idAnfitrion;
	}

	public String getAloj_descripcion() {
		return aloj_descripcion;
	}

	public void setAloj_descripcion(String aloj_descripcion) {
		this.aloj_descripcion = aloj_descripcion;
	}

	public DtDireccion getAloj_direcion() {
		return aloj_direcion;
	}

	public void setAloj_direcion(DtDireccion aloj_direcion) {
		this.aloj_direcion = aloj_direcion;
	}

	public String getAloj_nombre() {
		return aloj_nombre;
	}

	public void setAloj_nombre(String aloj_nombre) {
		this.aloj_nombre = aloj_nombre;
	}

	public String getHab_descripcion() {
		return hab_descripcion;
	}

	public void setHab_descripcion(String hab_descripcion) {
		this.hab_descripcion = hab_descripcion;
	}

	public Double getHab_precioNoche() {
		return hab_precioNoche;
	}

	public void setHab_precioNoche(Double hab_precioNoche) {
		this.hab_precioNoche = hab_precioNoche;
	}

	public int getHab_camas() {
		return hab_camas;
	}

	public void setHab_camas(int hab_camas) {
		this.hab_camas = hab_camas;
	}

	public DtServicios getHab_dtservicios() {
		return hab_dtservicios;
	}

	public void setHab_dtservicios(DtServicios hab_dtservicios) {
		this.hab_dtservicios = hab_dtservicios;
	}
	
}
