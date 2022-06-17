package com.amq.datatypes;

import com.amq.enums.ReservaEstado;

public class DtEnviarCalificacion {
	private int idUsrLogueado;
	private int idReserva;
	private Integer calificacion;
	private String resena;
	
	
	public DtEnviarCalificacion(int idUsrLogueado, int idReserva, Integer calificacion, String resena) {
		super();
		this.idUsrLogueado = idUsrLogueado;
		this.idReserva = idReserva;
		this.calificacion = calificacion;
		this.resena = resena;
	}
	public int getIdUsrLogueado() {
		return idUsrLogueado;
	}
	public void setIdUsrLogueado(int idUsrLogueado) {
		this.idUsrLogueado = idUsrLogueado;
	}
	public int getIdReserva() {
		return idReserva;
	}
	public void setIdReserva(int idReserva) {
		this.idReserva = idReserva;
	}
	public Integer getCalificacion() {
		return calificacion;
	}
	public void setCalificacion(Integer calificacion) {
		this.calificacion = calificacion;
	}
	public String getResena() {
		return resena;
	}
	public void setResena(String resena) {
		this.resena = resena;
	}
	
}
