package com.amq.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.OneToMany;

import org.hibernate.annotations.BatchSize;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import com.amq.enums.AprobacionEstado;

@Entity
@DiscriminatorValue("An")
public class Anfitrion extends Usuario implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Integer calificacionGlobal;
	
	@Enumerated(EnumType.STRING)
	@Fetch(FetchMode.SELECT)
	@BatchSize(size=10)
	private AprobacionEstado estado;
	
	private Boolean bloqueado;
	
	@OneToMany(mappedBy = "anfitrion",cascade = CascadeType.ALL,orphanRemoval=true)
	@Fetch(FetchMode.SELECT)
	@BatchSize(size=10)
	private List<Alojamiento> alojamientos = new ArrayList<Alojamiento>();
	
	private String telefono;
	
	public Anfitrion() {
		super();
	}
	public Anfitrion(String email, Boolean activo, String apellido, String nombre, Integer calificacion, List<Alojamiento> alojamientos, AprobacionEstado estado, String pass, Boolean bloqueado, String telefono) {
		super(email, activo, bloqueado, apellido, nombre, pass);
		this.calificacionGlobal = calificacion;
		this.estado = estado;
		this.alojamientos = alojamientos;
		this.bloqueado = bloqueado;
		this.telefono = telefono;
	}
	public Integer getCalificacionGlobal() {
		return calificacionGlobal;
	}
	public void setCalificacionGlobal(Integer calificacionGlobal) {
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
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public void agregarAlojamiento(Alojamiento alojamiento) {
		this.alojamientos.add(alojamiento);
	}
	public Boolean getBloqueado() {
		return bloqueado;
	}
	public void setBloqueado(Boolean bloqueado) {
		this.bloqueado = bloqueado;
	}
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
}
