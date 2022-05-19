package amq.datatypes;

import java.sql.Date;

import amq.enums.PagoEstado;

public class DtFactura {
	
	private PagoEstado pagoEstado;
	private Double monto;
	private DtFecha fecha;
	private boolean descuento;
	private Double montoDescuento;
	/**
	 * @param pagoEstado
	 * @param monto
	 * @param fecha
	 * @param descuento
	 * @param montoDescuento
	 */
	public DtFactura(PagoEstado pagoEstado, Double monto, DtFecha fecha, boolean descuento, Double montoDescuento) {
		super();
		this.pagoEstado = pagoEstado;
		this.monto = monto;
		this.fecha = fecha;
		this.descuento = descuento;
		this.montoDescuento = montoDescuento;
	}
	/**
	 * @return the pagoEstado
	 */
	public PagoEstado getPagoEstado() {
		return pagoEstado;
	}
	/**
	 * @param pagoEstado the pagoEstado to set
	 */
	public void setPagoEstado(PagoEstado pagoEstado) {
		this.pagoEstado = pagoEstado;
	}
	/**
	 * @return the monto
	 */
	public Double getMonto() {
		return monto;
	}
	/**
	 * @param monto the monto to set
	 */
	public void setMonto(Double monto) {
		this.monto = monto;
	}
	/**
	 * @return the fecha
	 */
	public DtFecha getFecha() {
		return fecha;
	}
	/**
	 * @param fecha the fecha to set
	 */
	public void setFecha(DtFecha fecha) {
		this.fecha = fecha;
	}
	/**
	 * @return the descuento
	 */
	public boolean isDescuento() {
		return descuento;
	}
	/**
	 * @param descuento the descuento to set
	 */
	public void setDescuento(boolean descuento) {
		this.descuento = descuento;
	}
	/**
	 * @return the montoDescuento
	 */
	public Double getMontoDescuento() {
		return montoDescuento;
	}
	/**
	 * @param montoDescuento the montoDescuento to set
	 */
	public void setMontoDescuento(Double montoDescuento) {
		this.montoDescuento = montoDescuento;
	}
	
	

}
