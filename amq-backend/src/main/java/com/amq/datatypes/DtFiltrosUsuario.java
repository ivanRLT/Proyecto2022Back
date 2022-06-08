package com.amq.datatypes;

public class DtFiltrosUsuario {
	private String tipo;
	private Boolean activo;
	private Boolean bloqueado;
	private Double calificacion_desde;
	private Double calificacion_hasta;
	private String estado;
	
	public DtFiltrosUsuario(){};
	
	public DtFiltrosUsuario(String tipo, Boolean activo, Boolean bloqueado, 
			Double calificacion_desde, Double calificacion_hasta, String estado) {
		super();
		this.tipo = tipo;
		this.activo = activo;
		this.bloqueado = bloqueado;
		this.calificacion_desde = calificacion_desde;
		this.calificacion_hasta = calificacion_hasta;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	public Boolean getActivo() {
		return activo;
	}
	public void setActivo(Boolean activo) {
		this.activo = activo;
	}
	public Boolean getBloqueado() {
		return bloqueado;
	}
	public void setBloqueado(Boolean bloqueado) {
		this.bloqueado = bloqueado;
	}
	public Double getCalificacion_desde() {
		return calificacion_desde;
	}
	public void setCalificacion_desde(Double calificacion_desde) {
		this.calificacion_desde = calificacion_desde;
	}
	public Double getCalificacion_hasta() {
		return calificacion_hasta;
	}
	public void setCalificacion_hasta(Double calificacion_hasta) {
		this.calificacion_hasta = calificacion_hasta;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}
}
