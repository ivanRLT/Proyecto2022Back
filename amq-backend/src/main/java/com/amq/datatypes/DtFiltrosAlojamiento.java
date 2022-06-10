package com.amq.datatypes;

public class DtFiltrosAlojamiento {
	private Integer id_anf;
	private Boolean aloj_activo;
	private String aloj_nombre;
	private String aloj_desc;
	private Integer aloj_idPais;
	private String aloj_ciudad;
	
	private String hab_desc;
	private Double hab_precio;
	private Double hab_precio_hasta;
	private Integer hab_camas;
	private Integer hab_camas_mas_de;
	private Boolean hab_serv_aire;
	private Boolean hab_serv_tvCable;
	private Boolean hab_serv_jacuzzi;
	private Boolean hab_serv_wifi;
	private Boolean hab_serv_desayuno;
	private Boolean hab_serv_parking;
	
	private Integer huespedConReserva;

	public DtFiltrosAlojamiento(Integer id_anf, Boolean aloj_activo, String aloj_nombre, String aloj_desc,
			Integer aloj_idPais, String aloj_ciudad, String hab_desc, Double hab_precio, Double hab_precio_hasta,
			Integer hab_camas, Integer hab_camas_mas_de, Boolean hab_serv_aire, Boolean hab_serv_tvCable,
			Boolean hab_serv_jacuzzi, Boolean hab_serv_wifi, Boolean hab_serv_desayuno, Boolean hab_serv_parking,
			Integer huespedConReserva) {
		super();
		this.id_anf = id_anf;
		this.aloj_activo = aloj_activo;
		this.aloj_nombre = aloj_nombre;
		this.aloj_desc = aloj_desc;
		this.aloj_idPais = aloj_idPais;
		this.aloj_ciudad = aloj_ciudad;
		this.hab_desc = hab_desc;
		this.hab_precio = hab_precio;
		this.hab_precio_hasta = hab_precio_hasta;
		this.hab_camas = hab_camas;
		this.hab_camas_mas_de = hab_camas_mas_de;
		this.hab_serv_aire = hab_serv_aire;
		this.hab_serv_tvCable = hab_serv_tvCable;
		this.hab_serv_jacuzzi = hab_serv_jacuzzi;
		this.hab_serv_wifi = hab_serv_wifi;
		this.hab_serv_desayuno = hab_serv_desayuno;
		this.hab_serv_parking = hab_serv_parking;
		this.huespedConReserva = huespedConReserva;
	}

	public Boolean isHab_serv_aire() {
		return hab_serv_aire;
	}

	public void setHab_serv_aire(Boolean hab_serv_aire) {
		this.hab_serv_aire = hab_serv_aire;
	}

	public Boolean isHab_serv_tvCable() {
		return hab_serv_tvCable;
	}

	public void setHab_serv_tvCable(Boolean hab_serv_tvCable) {
		this.hab_serv_tvCable = hab_serv_tvCable;
	}

	public Boolean isHab_serv_jacuzzi() {
		return hab_serv_jacuzzi;
	}

	public void setHab_serv_jacuzzi(Boolean hab_serv_jacuzzi) {
		this.hab_serv_jacuzzi = hab_serv_jacuzzi;
	}

	public Boolean isHab_serv_wifi() {
		return hab_serv_wifi;
	}

	public void setHab_serv_wifi(Boolean hab_serv_wifi) {
		this.hab_serv_wifi = hab_serv_wifi;
	}

	public Boolean isHab_serv_desayuno() {
		return hab_serv_desayuno;
	}

	public void setHab_serv_desayuno(Boolean hab_serv_desayuno) {
		this.hab_serv_desayuno = hab_serv_desayuno;
	}

	public Boolean isHab_serv_parking() {
		return hab_serv_parking;
	}

	public void setHab_serv_parking(Boolean hab_serv_parking) {
		this.hab_serv_parking = hab_serv_parking;
	}

	public Double getHab_precio_hasta() {
		return hab_precio_hasta;
	}

	public void setHab_precio_hasta(Double hab_precio_hasta) {
		this.hab_precio_hasta = hab_precio_hasta;
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
	
	public String getAloj_ciudad() {
		return aloj_ciudad;
	}

	public void setAloj_ciudad(String aloj_ciudad) {
		this.aloj_ciudad = aloj_ciudad;
	}

	public Integer getAloj_idPais() {
		return aloj_idPais;
	}

	public void setAloj_idPais(Integer aloj_idPais) {
		this.aloj_idPais = aloj_idPais;
	}

	public Boolean getHab_serv_aire() {
		return hab_serv_aire;
	}

	public Boolean getHab_serv_tvCable() {
		return hab_serv_tvCable;
	}

	public Boolean getHab_serv_jacuzzi() {
		return hab_serv_jacuzzi;
	}

	public Boolean getHab_serv_wifi() {
		return hab_serv_wifi;
	}

	public Boolean getHab_serv_desayuno() {
		return hab_serv_desayuno;
	}

	public Boolean getHab_serv_parking() {
		return hab_serv_parking;
	}

	public Integer getHuespedConReserva() {
		return huespedConReserva;
	}

	public void setHuespedConReserva(Integer huespedConReserva) {
		this.huespedConReserva = huespedConReserva;
	}
	
	
}
