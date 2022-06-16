package com.amq.datatypes;

public class DtCalificarDatosRequeridosInput {
	private int idHu;
	private Integer idPais;
	
	public DtCalificarDatosRequeridosInput(int idHu, Integer idPais) {
		super();
		this.idHu = idHu;
		this.idPais = idPais==null ? 0 : idPais;
	}
	
	public int getIdHu() {
		return idHu;
	}
	public void setIdHu(int idHu) {
		this.idHu = idHu;
	}
	public Integer getIdpais() {
		return idPais;
	}
	public void setIdpais(Integer idPais) {
		this.idPais = idPais;
	}
	
	
}
