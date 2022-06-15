package com.amq.datatypes;

public class DtFiltroResenas {
	private int idAloj;
	private DtFecha fInicio;
	private DtFecha fFin;
	private Integer calAnfDesde;
	private Integer calAnfHasta;
	
	public DtFiltroResenas(int idAloj, DtFecha fInicio, DtFecha fFin, Integer calAnfDesde, Integer calAnfHasta) {
		super();
		this.idAloj = idAloj;
		this.fInicio = fInicio;
		this.fFin = fFin;
		this.calAnfDesde = calAnfDesde;
		this.calAnfHasta = calAnfHasta;
	}

	public int getIdAloj() {
		return idAloj;
	}

	public void setIdAloj(int idAloj) {
		this.idAloj = idAloj;
	}

	public DtFecha getFInicio() {
		return fInicio;
	}

	public void setFInicio(DtFecha fInicio) {
		this.fInicio = fInicio;
	}

	public DtFecha getFFin() {
		return fFin;
	}

	public void setFFin(DtFecha fFin) {
		this.fFin = fFin;
	}

	public Integer getCalAnfDesde() {
		return calAnfDesde;
	}

	public void setCalAnfDesde(Integer calAnfDesde) {
		this.calAnfDesde = calAnfDesde;
	}

	public Integer getCalAnfHasta() {
		return calAnfHasta;
	}

	public void setCalHasta(Integer calHasta) {
		this.calAnfHasta = calHasta;
	}
	
	
}
