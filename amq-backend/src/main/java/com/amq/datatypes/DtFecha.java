package com.amq.datatypes;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "fechas")
public class DtFecha {
	@Id
	private int id;
	private int dia;
	private int mes;
	private int anio;
	
	public DtFecha() {
		super();
	}
	
	public DtFecha(int dia, int mes, int anio) {
		super();
		this.dia = dia;
		this.mes = mes;
		this.anio = anio;
	}
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
        public int getId() {
        return id;
    }
	public int getDia() {
		return dia;
	}
	public void setDia(int dia) {
		this.dia = dia;
	}
	public int getMes() {
		return mes;
	}
	public void setMes(int mes) {
		this.mes = mes;
	}
	public int getAnio() {
		return anio;
	}
	public void setAnio(int anio) {
		this.anio = anio;
	}
}
