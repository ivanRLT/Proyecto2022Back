package com.amq.datatypes;

public class DtAltaReserva {
	private int idHu;
	private int idHab;
	private int cantDias;
	private String fInicio;
	private String fFin;
	private Boolean tieneDescuento;
	private Double descuento;
	private String idPaypal;

	public DtAltaReserva(int idHu, int idHab, int cantDias, String fInicio, String fFin, Boolean tieneDescuento,
			Double descuento, String idPaypal) {
		super();
		this.idHu = idHu;
		this.idHab = idHab;
		this.cantDias = cantDias;
		this.fInicio = fInicio;
		this.fFin = fFin;
		this.tieneDescuento = tieneDescuento;
		this.descuento = descuento;
		this.idPaypal = idPaypal;
	}

	public int getIdHu() {
		return idHu;
	}

	public void setIdHu(int idHu) {
		this.idHu = idHu;
	}

	public int getIdHab() {
		return idHab;
	}

	public void setIdHab(int idHab) {
		this.idHab = idHab;
	}

	public int getCantDias() {
		return cantDias;
	}

	public void setCantDias(int cantDias) {
		this.cantDias = cantDias;
	}

	public String getFInicio() {
		return fInicio;
	}

	public void setFInicio(String fInicio) {
		this.fInicio = fInicio;
	}

	public String getFFin() {
		return fFin;	}

	public void setFFin(String fFin) {
		this.fFin = fFin;
	}

	public Boolean getTieneDescuento() {
		return tieneDescuento;
	}

	public void setTieneDescuento(Boolean tieneDescuento) {
		this.tieneDescuento = tieneDescuento;
	}

	public Double getDescuento() {
		return descuento;
	}

	public void setDescuento(Double descuento) {
		this.descuento = descuento;
	}

	public String getIdPaypal() {
		return idPaypal;
	}

	public void setIdPaypal(String idPaypal) {
		this.idPaypal = idPaypal;
	}
	
	
}