package com.amq.datatypes;

public class DtCalificarDatosRequeridosInput {
	private int idHu;
	private Integer idPais;
	private Boolean aloj_activo;
	
	
	
	public DtCalificarDatosRequeridosInput(int idHu, Integer idPais, Boolean aloj_activo) {
		super();
		this.idHu = idHu;
		this.idPais = idPais;
		this.aloj_activo = aloj_activo;
	}
	public int getIdHu() {
		return idHu;
	}
	public void setIdHu(int idHu) {
		this.idHu = idHu;
	}
	public Integer getIdPais() {
		return idPais;
	}
	public void setIdPais(Integer idPais) {
		this.idPais = idPais;
	}
	public Boolean getAloj_activo() {
		return aloj_activo;
	}
	public void setAloj_activo(Boolean aloj_activo) {
		this.aloj_activo = aloj_activo;
	}
	
	
	
	
}
