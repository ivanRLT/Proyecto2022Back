package com.amq.model;

import java.io.Serializable;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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
public class Reserva implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Enumerated(EnumType.STRING)
	private ReservaEstado estado;
	
	private Date fechaInicio;
	
	private Date fechaFin;
	
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
		
		Calendar calendar = Calendar.getInstance();
		calendar.set(fechaInicio.getAnio(), fechaInicio.getMes(), fechaInicio.getDia(), 00, 00, 00);
		this.fechaInicio =(Date) calendar.getTime();
		
		Calendar calendarF = Calendar.getInstance();
		calendarF.set(fechaFin.getAnio(), fechaFin.getMes(), fechaFin.getDia(), 00, 00, 00);
		this.fechaFin =(Date) calendarF.getTime();
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
		DateFormat stranio = new SimpleDateFormat("yyyy");  
        String anio = stranio.format(this.fechaInicio);  
        DateFormat strmes = new SimpleDateFormat("mm");  
        String mes = strmes.format(this.fechaInicio);  
        DateFormat strdia = new SimpleDateFormat("dd");  
        String dia = strdia.format(this.fechaInicio);
        int anior = Integer.parseInt(anio);
        int mesr = Integer.parseInt(mes);
        int diar = Integer.parseInt(dia);
        DtFecha retorno = new DtFecha(diar,mesr,anior);
		return retorno;
	}
	public void setFechaInicio(DtFecha fechaInicio) {
		Calendar calendar = Calendar.getInstance();
		calendar.set(fechaInicio.getAnio(), fechaInicio.getMes(), fechaInicio.getDia(), 00, 00, 00);
		this.fechaInicio =(Date) calendar.getTime();
	}
	public DtFecha getFechaFin() {
		DateFormat stranio = new SimpleDateFormat("yyyy");  
        String anio = stranio.format(this.fechaFin);  
        DateFormat strmes = new SimpleDateFormat("mm");  
        String mes = strmes.format(this.fechaFin);  
        DateFormat strdia = new SimpleDateFormat("dd");  
        String dia = strdia.format(this.fechaFin);
        int anior = Integer.parseInt(anio);
        int mesr = Integer.parseInt(mes);
        int diar = Integer.parseInt(dia);
        DtFecha retorno = new DtFecha(diar,mesr,anior);
		return retorno;
	}
	public void setFechaFin(DtFecha fechaFin) {
		Calendar calendarF = Calendar.getInstance();
		calendarF.set(fechaFin.getAnio(), fechaFin.getMes(), fechaFin.getDia(), 00, 00, 00);
		this.fechaFin =(Date) calendarF.getTime();
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
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
