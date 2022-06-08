package com.amq.datatypes;

public class DtAltaReserva {
	private int idHu;
	private int idHab;
	private int cantDias;
	private DtFecha fInicio;
	private DtFecha fFin;
	private Double descuento;
	private String idPaypal;
	
	public DtAltaReserva(int idHu, int idHab, int cantDias, DtFecha fInicio, DtFecha fFin, Double descuento,
			String idPaypal) {
		super();
		this.idHu = idHu;
		this.idHab = idHab;
		this.cantDias = cantDias;
		this.fInicio = fInicio;
		this.fFin = fFin;
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

	public DtFecha getfInicio() {
		return fInicio;
	}

	public void setfInicio(DtFecha fInicio) {
		this.fInicio = fInicio;
	}

	public DtFecha getfFin() {
		return fFin;
	}

	public void setfFin(DtFecha fFin) {
		this.fFin = fFin;
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
