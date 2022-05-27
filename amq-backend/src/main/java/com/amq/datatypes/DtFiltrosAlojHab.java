package com.amq.datatypes;

public class DtFiltrosAlojHab {
	private int id_anf;
	private Boolean aloj_activo;
	private String aloj_nombre;
	private String aloj_desc;
	private int camas;
	private int camas_mas_de;
	private int camas_menos_de;
	private DtServicios serv;
	
	public DtFiltrosAlojHab(int id_anf, Boolean aloj_activo, String nombre, String aloj_desc, int camas,
			int camas_mas_de, int camas_menos_de, DtServicios serv) {
		super();
		this.id_anf = id_anf;
		this.aloj_activo = aloj_activo;
		this.aloj_nombre = nombre;
		this.aloj_desc = aloj_desc;
		this.camas = camas;
		this.camas_mas_de = camas_mas_de;
		this.camas_menos_de = camas_menos_de;
		this.serv = serv;
	}
	public int getId_anf() {
		return id_anf;
	}
	public void setId_anf(int id_anf) {
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
	public void setAloj_nombre(String nombre) {
		this.aloj_nombre = nombre;
	}
	public String getAloj_desc() {
		return aloj_desc;
	}
	public void setAloj_desc(String aloj_desc) {
		this.aloj_desc = aloj_desc;
	}
	public int getCamas() {
		return camas;
	}
	public void setCamas(int camas) {
		this.camas = camas;
	}
	public int getCamas_mas_de() {
		return camas_mas_de;
	}
	public void setCamas_mas_de(int camas_mas_de) {
		this.camas_mas_de = camas_mas_de;
	}
	public int getCamas_menos_de() {
		return camas_menos_de;
	}
	public void setCamas_menos_de(int camas_menos_de) {
		this.camas_menos_de = camas_menos_de;
	}
	public DtServicios getServ() {
		return serv;
	}
	public void setServ(DtServicios serv) {
		this.serv = serv;
	}
	
	
}
