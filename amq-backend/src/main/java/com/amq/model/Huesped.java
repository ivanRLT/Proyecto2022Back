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
	
	private Integer calificacionGlobal;
	
	private Boolean bloqueado;
	
	@ElementCollection
	private List<String> pushTokens = new ArrayList<String>();
	
	@OneToMany(mappedBy = "huesped",cascade = CascadeType.ALL,orphanRemoval=true)
	private List<Reserva> reservas = new ArrayList<Reserva>();
	
	private Integer telefono;
	
	public Huesped() {
		super();
	}
	public Huesped(String email, Boolean activo, String apellido, String nombre, Integer calificacion, List<String> tokens, String pass, Boolean bloqueado, Integer telefono) {
		super(email, activo, bloqueado, apellido, nombre, pass);
		this.calificacionGlobal = calificacion;
		this.pushTokens = tokens;
		this.bloqueado = bloqueado;
		this.telefono = telefono;
	}
	public Integer getCalificacionGlobal() {
		return calificacionGlobal;
	}
	public void setCalificacionGlobal(Integer calificacionGlobal) {
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
	public Boolean getBloqueado() {
		return bloqueado;
	}
	public void setBloqueado(Boolean bloqueado) {
		this.bloqueado = bloqueado;
	}
	public Integer getTelefono() {
		return telefono;
	}
	public void setTelefono(Integer telefono) {
		this.telefono = telefono;
	}
	
	
	
}
