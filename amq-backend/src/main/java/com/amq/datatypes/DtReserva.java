package com.amq.datatypes;

import java.util.Date;
import java.util.List;

import com.amq.enums.ReservaEstado;

//import amq.entidades.Habitacion;

public class DtReserva {
	
	private ReservaEstado estado;
	private DtFecha fechaInicio;
	private DtFecha fechaFin;
	private String idChat;
	private int cantidadDias;
	private DtHabitacion dtHabitacion;
	private List<DtFactura> dtFacturas;
	private DtCalificacion dtCalificacion;
	
	public DtReserva(ReservaEstado estado, DtFecha fechaInicio, DtFecha fechaFin, String idChat, int cantidadDias, List<DtFactura> dtFacturas, DtCalificacion dtCalificacion) {
		super();
		this.estado = estado;
		this.fechaInicio = fechaInicio;
		this.fechaFin = fechaFin;
		this.idChat = idChat;
		this.cantidadDias = cantidadDias;
		this.dtFacturas = dtFacturas;
		this.dtCalificacion = dtCalificacion;
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
	public String getIdChat() {
		return idChat;
	}
	public void setIdChat(String idChat) {
		this.idChat = idChat;
	}
	public int getCantidadDias() {
		return cantidadDias;
	}
	public void setCantidadDias(int cantidadDias) {
		this.cantidadDias = cantidadDias;
	}
	public DtHabitacion getDtHabitacion() {
		return dtHabitacion;
	}
	public void setDtHabitacion(DtHabitacion dtHabitacion) {
		this.dtHabitacion = dtHabitacion;
	}
	public List<DtFactura> getDtFacturas() {
		return dtFacturas;
	}
	public void setDtFacturas(List<DtFactura> dtFacturas) {
		this.dtFacturas = dtFacturas;
	}
	public DtCalificacion getDtCalificacion() {
		return dtCalificacion;
	}
	public void setDtCalificacion(DtCalificacion dtCalificacion) {
		this.dtCalificacion = dtCalificacion;
	}
}
