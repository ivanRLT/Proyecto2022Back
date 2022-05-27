package com.amq.datatypes;

public class DtFiltrosAlojamiento {
	private Integer id_anf;
	private Boolean aloj_activo;
	private String aloj_nombre;
	private String aloj_desc;
	private String aloj_pais;
	private String aloj_ciudad;
	
	public String getAloj_pais() {
		return aloj_pais;
	}

	

	public DtFiltrosAlojamiento(Integer id_anf, Boolean aloj_activo, String aloj_nombre, String aloj_desc,
			String aloj_pais, String aloj_ciudad) {
		super();
		this.id_anf = id_anf;
		this.aloj_activo = aloj_activo;
		this.aloj_nombre = aloj_nombre;
		this.aloj_desc = aloj_desc;
		this.aloj_pais = aloj_pais;
		this.aloj_ciudad = aloj_ciudad;
	}



	public Integer getId_anf() {
		return id_anf;
	}

	public void setId_anf(Integer id_anf) {
		this.id_anf = id_anf;
	}

	public Boolean getAloj_activo() {
		return aloj_activo;
	}

	public void setAloj_activo(Boolean aloj_activo) {
		this.aloj_activo = aloj_activo;
	}

	public String getAloj_nombre() {
		return aloj_nombre;
	}

	public void setAloj_nombre(String aloj_nombre) {
		this.aloj_nombre = aloj_nombre;
	}

	public String getAloj_desc() {
		return aloj_desc;
	}

	public void setAloj_desc(String aloj_desc) {
		this.aloj_desc = aloj_desc;
	}
	
	public void setAloj_pais(String aloj_pais) {
		this.aloj_pais = aloj_pais;
	}

	public String getAloj_ciudad() {
		return aloj_ciudad;
	}

	public void setAloj_ciudad(String aloj_ciudad) {
		this.aloj_ciudad = aloj_ciudad;
	}
}
