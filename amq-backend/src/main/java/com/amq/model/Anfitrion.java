package com.amq.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.OneToMany;

import com.amq.enums.AprobacionEstado;

@Entity
@DiscriminatorValue("Am")
public class Anfitrion extends Usuario {
	private int calificacionGlobal;
	@Enumerated(EnumType.STRING)
	private AprobacionEstado estado;
	
	@OneToMany(mappedBy = "anfitrion",cascade = CascadeType.ALL,orphanRemoval=true)
	private List<Alojamiento> alojamientos = new ArrayList<Alojamiento>();
	
	public Anfitrion() {
		super();
	}
	public Anfitrion(String email, Boolean activo, String apellido, String nombre, int calificacion, List<Alojamiento> alojamientos, AprobacionEstado estado, String pass) {
		super(email, activo, apellido, nombre, pass);
		this.calificacionGlobal = calificacion;
		this.estado = estado;
		this.alojamientos = alojamientos;
	}
	public int getCalificacionGlobal() {
		return calificacionGlobal;
	}
	public void setCalificacionGlobal(int calificacionGlobal) {
		this.calificacionGlobal = calificacionGlobal;
	}
	public AprobacionEstado getEstado() {
		return estado;
	}
	public void setEstado(AprobacionEstado estado) {
		this.estado = estado;
	}
	public List<Alojamiento> getAlojamientos() {
		return alojamientos;
	}
	public void setAlojamientos(List<Alojamiento> alojamientos) {
		this.alojamientos = alojamientos;
	}
	public void addAlojamiento(Alojamiento alojamiento) {
		this.alojamientos.add(alojamiento);
	}
}
