package com.amq.model;

import java.util.Date;
import java.io.Serializable;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.amq.datatypes.DtFecha;
import com.amq.enums.PagoEstado;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "facturas")
public class Factura implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Enumerated(EnumType.STRING)
	private PagoEstado estado;
	
	private double monto;
	
	private Date fecha;
	
	private Boolean descuento;
	
	private double montoDescuento;
	
	@JsonIgnore
	@ManyToOne
	private Reserva reserva;
	
	public Factura() {
		super();
	}
	public Factura(int id, double monto, Boolean descuento, double montoDescuento, PagoEstado estado, DtFecha fecha, Reserva reserva) {
		super();
		this.id = id;
		this.monto = monto;
		this.descuento = descuento;
		this.montoDescuento = montoDescuento;
		this.estado = estado;
		Calendar calendar = Calendar.getInstance();
		calendar.set(fecha.getAnio(), fecha.getMes(), fecha.getDia(), 00, 00, 00);
		this.fecha =(Date) calendar.getTime();
		this.reserva = reserva;
	}
        public int getId() {
        return id;
    }
	public void setId(int id) {
		this.id = id;
	}
	public double getMonto() {
		return monto;
	}
	public void setMonto(double monto) {
		this.monto = monto;
	}
	public Boolean getDescuento() {
		return descuento;
	}
	public void setDescuento(Boolean descuento) {
		this.descuento = descuento;
	}
	public double getMontoDescuento() {
		return montoDescuento;
	}
	public void setMontoDescuento(double montoDescuento) {
		this.montoDescuento = montoDescuento;
	}
	public PagoEstado getEstado() {
		return estado;
	}
	public void setEstado(PagoEstado estado) {
		this.estado = estado;
	}
	public DtFecha getFecha() {
		DateFormat stranio = new SimpleDateFormat("yyyy");  
        String anio = stranio.format(this.fecha);  
        DateFormat strmes = new SimpleDateFormat("mm");  
        String mes = strmes.format(this.fecha);  
        DateFormat strdia = new SimpleDateFormat("dd");  
        String dia = strdia.format(this.fecha);
        int anior = Integer.parseInt(anio);
        int mesr = Integer.parseInt(mes);
        int diar = Integer.parseInt(dia);
        DtFecha retorno = new DtFecha(diar,mesr,anior);
		return retorno;
	}
	public void setFecha(DtFecha fecha) {
		Calendar calendar = Calendar.getInstance();
		calendar.set(fecha.getAnio(), fecha.getMes(), fecha.getDia(), 00, 00, 00);
		this.fecha =(Date) calendar.getTime();
	}
	public Reserva getFactura() {
		return reserva;
	}
	public void setFactura(Reserva reserva) {
		this.reserva = reserva;
	}
	
}
