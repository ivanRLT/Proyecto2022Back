package com.amq.datatypes;

public class DtFiltroResenas {
	private int idAloj;
	private DtFecha fInicio;
	private DtFecha fFin;
	private Integer calAnfitrion;
	private Integer calHuesped;
	
	public DtFiltroResenas(int idAloj, DtFecha fInicio, DtFecha fFin, Integer calAnfitrion, Integer calHuesped) {
		super();
		this.idAloj = idAloj;
		this.fInicio = fInicio;
		this.fFin = fFin;
		this.calAnfitrion = calAnfitrion;
		this.calHuesped = calHuesped;
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

	public Integer getCalAnfitrion() {
		return calAnfitrion;
	}

	public void setCalAnfitrion(Integer calAnfitrion) {
		this.calAnfitrion = calAnfitrion;
	}

	public Integer getCalHuesped() {
		return calHuesped;
	}

	public void setCalHuesped(Integer calHuesped) {
		this.calHuesped = calHuesped;
	}
	
}
