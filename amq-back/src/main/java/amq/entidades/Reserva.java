package amq.entidades;

import java.util.ArrayList;
import java.util.List;

import amq.datatypes.DtFecha;
import amq.enums.ReservaEstado;

public class Reserva {
	private int id;
	private ReservaEstado estado;
	private DtFecha fechaInicio;
	private DtFecha fechaFin;
	private String idChat;
	private int cantDias;
	private Calificacion calificacion;
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
