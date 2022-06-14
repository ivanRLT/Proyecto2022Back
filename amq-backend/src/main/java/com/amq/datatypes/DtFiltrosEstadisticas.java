package com.amq.datatypes;

public class DtFiltrosEstadisticas {
	DtFecha dtFIni;
	DtFecha dtFFin;
	
	public DtFiltrosEstadisticas() {}
	
	public DtFiltrosEstadisticas(DtFecha dtFIni, DtFecha dtFFin) {
		super();
		this.dtFIni = dtFIni;
		this.dtFFin = dtFFin;
	}

	public DtFecha getDtFIni() {
		return dtFIni;
	}

	public void setDtFIni(DtFecha dtFIni) {
		this.dtFIni = dtFIni;
	}

	public DtFecha getDtFFin() {
		return dtFFin;
	}

	public void setDtFFin(DtFecha dtFFin) {
		this.dtFFin = dtFFin;
	}

}
