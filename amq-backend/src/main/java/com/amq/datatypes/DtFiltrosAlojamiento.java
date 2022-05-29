package com.amq.datatypes;

public class DtFiltrosAlojamiento {
	private Integer id_anf;
	private Boolean aloj_activo;
	private String aloj_nombre;
	private String aloj_desc;
	private String aloj_pais;
	private String aloj_ciudad;
	
	private String hab_desc;
	private Double hab_precio;
	private Double hab_precio_hasta;
	private Integer hab_camas;
	private Integer hab_camas_mas_de;
	private DtServicios hab_servicios;
	
	
	public DtFiltrosAlojamiento(Integer id_anf, Boolean aloj_activo, String aloj_nombre, String aloj_desc,
			String aloj_pais, String aloj_ciudad, String hab_desc, Double hab_precio, Double hab_precio_hasta,
			Integer hab_camas, Integer hab_camas_mas_de, DtServicios hab_servicios) {
		super();
		this.id_anf = id_anf;
		this.aloj_activo = aloj_activo;
		this.aloj_nombre = aloj_nombre;
		this.aloj_desc = aloj_desc;
		this.aloj_pais = aloj_pais;
		this.aloj_ciudad = aloj_ciudad;
		this.hab_desc = hab_desc;
		this.hab_precio = hab_precio;
		this.hab_precio_hasta = hab_precio_hasta;
		this.hab_camas = hab_camas;
		this.hab_camas_mas_de = hab_camas_mas_de;
		this.hab_servicios = hab_servicios;
	}

	public Double getHab_precio_hasta() {
		return hab_precio_hasta;
	}

	public void setHab_precio_hasta(Double hab_precio_hasta) {
		this.hab_precio_hasta = hab_precio_hasta;
	}

	public DtServicios getHab_servicios() {
		return hab_servicios;
	}

	public void setHab_servicios(DtServicios hab_servicios) {
		this.hab_servicios = hab_servicios;
	}

	public String getHab_desc() {
		return hab_desc;
	}

	public void setHab_desc(String hab_desc) {
		this.hab_desc = hab_desc;
	}

	public Double getHab_precio() {
		return hab_precio;
	}

	public void setHab_precio(Double hab_precio) {
		this.hab_precio = hab_precio;
	}

	public Integer getHab_camas() {
		return hab_camas;
	}

	public void setHab_camas(Integer hab_camas) {
		this.hab_camas = hab_camas;
	}

	public Integer getHab_camas_mas_de() {
		return hab_camas_mas_de;
	}

	public void setHab_camas_mas_de(Integer hab_camas_mas_de) {
		this.hab_camas_mas_de = hab_camas_mas_de;
	}

	public String getAloj_pais() {
		return aloj_pais;
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
