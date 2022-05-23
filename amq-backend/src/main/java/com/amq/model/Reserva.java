package com.amq.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.amq.datatypes.DtFecha;
import com.amq.enums.ReservaEstado;

@Entity
@Table(name = "reservas")
public class Reserva {
	@Id
	private int id;
	@Enumerated(EnumType.STRING)
	private ReservaEstado estado;
	private DtFecha fechaInicio;
	private DtFecha fechaFin;
	private String idChat;
	private int cantDias;
	@ManyToOne
	private Calificacion calificacion;
	@OneToMany(mappedBy = "Reserva",cascade = CascadeType.ALL,orphanRemoval=true)
	private List<Factura> facturas = new ArrayList<Factura>();
	
	public Reserva() {
		super();
	}
	public Reserva(int id, String idChat, int cantDias, ReservaEstado estado, DtFecha fechaInicio, DtFecha fechaFin) {
		super();
		this.id = id;
		this.idChat = idChat;
		this.cantDias = cantDias;
		this.estado = estado;
		this.fechaInicio = fechaInicio;
		this.fechaFin = fechaFin;
	}
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
        public int getId() {
        return id;
    }
	public void setId(int id) {
		this.id = id;
	}
	public String getIdChat() {
		return idChat;
	}
	public void setIdChat(String idChat) {
		this.idChat = idChat;
	}
	public int getCantDias() {
		return cantDias;
	}
	public void setCantDias(int cantDias) {
		this.cantDias = cantDias;
	}
	public ReservaEstado getEstado() {
		return estado;
	}
	public void setEstado(ReservaEstado estado) {
		this.estado = estado;
	}
	public DtFecha getFechaInicio() {
		return fechaInicio;
	}
	public void setFechaInicio(DtFecha fechaInicio) {
		this.fechaInicio = fechaInicio;
	}
	public DtFecha getFechaFin() {
		return fechaFin;
	}
	public void setFechaFin(DtFecha fechaFin) {
		this.fechaFin = fechaFin;
	}
	public Calificacion getCalificacion() {
		return calificacion;
	}
	public void setCalificacion(Calificacion calificacion) {
		this.calificacion = calificacion;
	}
	public List<Factura> getFacturas() {
		return facturas;
	}
	public void setFacturas(List<Factura> facturas) {
		this.facturas = facturas;
	}
	
}
