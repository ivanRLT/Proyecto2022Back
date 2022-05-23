package com.amq.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.OneToMany;

@Entity
@DiscriminatorValue("Hu")
public class Huesped extends Usuario implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int calificacionGlobal;
	
	@ElementCollection
	private List<String> pushTokens = new ArrayList<String>();
	
	@OneToMany(mappedBy = "huesped",cascade = CascadeType.ALL,orphanRemoval=true)
	private List<Reserva> reservas = new ArrayList<Reserva>();
	
	public Huesped() {
		super();
	}
	public Huesped(String email, Boolean activo, String apellido, String nombre, int calificacion, List<String> tokens, String pass) {
		super(email, activo, apellido, nombre, pass);
		this.calificacionGlobal = calificacion;
		this.pushTokens = tokens;
	}
	public int getCalificacionGlobal() {
		return calificacionGlobal;
	}
	public void setCalificacionGlobal(int calificacionGlobal) {
		this.calificacionGlobal = calificacionGlobal;
	}
	public List<String> getPushTokens() {
		return pushTokens;
	}
	public void setPushTokens(List<String> pushTokens) {
		this.pushTokens = pushTokens;
	}
	public List<Reserva> getReservas() {
		return reservas;
	}
	public void setReservas(List<Reserva> reservas) {
		this.reservas = reservas;
	}
	public void addReserva(Reserva reservas) {
		this.reservas.add(reservas);
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}