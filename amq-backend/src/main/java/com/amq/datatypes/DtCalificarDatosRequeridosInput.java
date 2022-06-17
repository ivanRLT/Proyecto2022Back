package com.amq.datatypes;

public class DtCalificarDatosRequeridosInput {
	private int idUsuario;
	private Integer idPais;
	private Boolean aloj_activo;
	
	public DtCalificarDatosRequeridosInput(int idUsuario, Integer idPais, Boolean aloj_activo) {
		super();
		this.idUsuario = idUsuario;
		this.idPais = idPais;
		this.aloj_activo = aloj_activo;
	}
	public int getIdUsuario() {
		return idUsuario;
	}
	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
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
