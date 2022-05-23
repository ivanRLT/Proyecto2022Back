package com.amq.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.amq.datatypes.DtDireccion;

@Entity
@Table(name = "alojamientos")
public class Alojamiento implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private Boolean activo;
	
	private String descripcion;
	
	@ManyToOne
	private Anfitrion anfitrion;
	
	@OneToOne   
	@JoinColumn(name = "alojamiento_dir")
	private DtDireccion direccion;
	
	private String nombre;
	
	@OneToMany(mappedBy = "alojamiento",cascade = CascadeType.ALL,orphanRemoval=true)
	private List<Habitacion> habitaciones = new ArrayList<Habitacion>();
	
	public Alojamiento() {
		super();
	}
	public Alojamiento(int id, Boolean activo, String descripcion, String nombre, DtDireccion direccion, List<Habitacion> habitaciones, Anfitrion anfitrion) {
		super();
		this.id = id;
		this.activo = activo;
		this.descripcion = descripcion;
		this.nombre = nombre;
		this.direccion = direccion;
		this.habitaciones = habitaciones;
		this.anfitrion = anfitrion;
	}

        public int getId() {
        return id;
    }
	public void setId(int id) {
		this.id = id;
	}
	public Boolean getActivo() {
		return activo;
	}
	public void setActivo(Boolean activo) {
		this.activo = activo;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public DtDireccion getDireccion() {
		return direccion;
	}
	public void setDireccion(DtDireccion direccion) {
		this.direccion = direccion;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public List<Habitacion> getHabitaciones() {
		return habitaciones;
	}
	public void setHabitaciones(List<Habitacion> habitaciones) {
		this.habitaciones = habitaciones;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public Anfitrion getAnfitrion() {
		return anfitrion;
	}
	public void setAnfitrion(Anfitrion anfitrion) {
		this.anfitrion = anfitrion;
	}
	
}
