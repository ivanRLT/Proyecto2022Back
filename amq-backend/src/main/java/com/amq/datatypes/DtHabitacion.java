package com.amq.datatypes;

import java.util.ArrayList;

public class DtHabitacion {
	
	private String descripcion;
	private Double precioNoche;
	private int camas;
	private DtServicios dtservicios;
	
	public DtHabitacion(String descripcion, Double precioNoche, int camas, 
			DtServicios dtservicios,
			ArrayList<DtReserva> dtReservas) {
		super();
		this.descripcion = descripcion;
		this.precioNoche = precioNoche;
		this.camas = camas;
		this.dtservicios = dtservicios;
	}
	

	public String getDescripcion() {
		return descripcion;
	}


	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public Double getPrecioNoche() {
		return precioNoche;
	}

	public void setPrecioNoche(Double precioNoche) {
		this.precioNoche = precioNoche;
	}

	public int getCamas() {
		return camas;
	}

	public void setCamas(int camas) {
		this.camas = camas;
	}

	public DtServicios getDtservicios() {
		return dtservicios;
	}

	public void setDtservicios(DtServicios dtservicios) {
		this.dtservicios = dtservicios;
	}
	
	

}
