package com.amq.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.amq.datatypes.DtServicios;

@Entity
@Table(name = "habitaciones")
public class Habitacion {
	@Id
	private int id;
	private String descripcion;
	private Double precioNoche;
	private int camas;
	private DtServicios servicios;
	@OneToMany(mappedBy = "habitacion",cascade = CascadeType.ALL,orphanRemoval=true)
	private List<Reserva> reservas = new ArrayList<Reserva>();
	
	public Habitacion() {
		super();
	}
	public Habitacion(int id, String descripcion, Double precioNoche, int camas, DtServicios servicios) {
		super();
		this.id = id;
		this.descripcion = descripcion;
		this.precioNoche = precioNoche;
		this.camas = camas;
		this.servicios = servicios;
	}
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
        public int getId() {
        return id;
    }
	public void setId(int id) {
		this.id = id;
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
	public DtServicios getServicios() {
		return servicios;
	}
	public void setServicios(DtServicios servicios) {
		this.servicios = servicios;
	}
	public List<Reserva> getReservas() {
		return reservas;
	}
	public void setReservas(List<Reserva> reservas) {
		this.reservas = reservas;
	}
}
