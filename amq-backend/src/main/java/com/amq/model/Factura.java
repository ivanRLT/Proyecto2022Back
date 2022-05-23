package com.amq.model;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.amq.datatypes.DtFecha;
import com.amq.enums.PagoEstado;

@Entity
@Table(name = "facturas")
public class Factura {
	@Id
	private int id;
	@Enumerated(EnumType.STRING)
	private PagoEstado estado;
	private double monto;
	private DtFecha fecha;
	private Boolean descuento;
	private double montoDescuento;
	
	public Factura() {
		super();
	}
	public Factura(int id, double monto, Boolean descuento, double montoDescuento, PagoEstado estado, DtFecha fecha) {
		super();
		this.id = id;
		this.monto = monto;
		this.descuento = descuento;
		this.montoDescuento = montoDescuento;
		this.estado = estado;
		this.fecha = fecha;
	}
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
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
		return fecha;
	}
	public void setFecha(DtFecha fecha) {
		this.fecha = fecha;
	}
}
