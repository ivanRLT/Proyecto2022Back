package com.amq.datatypes;

public class DtCalificarDatosRequeridos {
	private int aloj_id;
	private Boolean aloj_activo;
	private String aloj_nombre;
	private String aloj_descripcion;
	private String aloj_dir_calle;
	private String aloj_dir_numero;
	private String aloj_dir_ciudad;
	private int aloj_dir_pais_id;
	private String  aloj_dir_pais_nombre;
	private int res_id;
	private int anf_id;
	private Integer anf_calificacion;
	private Integer hu_calificacion;
	
	public DtCalificarDatosRequeridos(int aloj_id, Boolean aloj_activo, String aloj_nombre, String aloj_descripcion,
			String aloj_dir_calle, String aloj_dir_numero, String aloj_dir_ciudad, int aloj_dir_pais_id,
			String aloj_dir_pais_nombre, int res_id, int anf_id, Integer anf_calificacion, Integer hu_calificacion) {
		super();
		this.aloj_id = aloj_id;
		this.aloj_activo = aloj_activo;
		this.aloj_nombre = aloj_nombre;
		this.aloj_descripcion = aloj_descripcion;
		this.aloj_dir_calle = aloj_dir_calle;
		this.aloj_dir_numero = aloj_dir_numero;
		this.aloj_dir_ciudad = aloj_dir_ciudad;
		this.aloj_dir_pais_id = aloj_dir_pais_id;
		this.aloj_dir_pais_nombre = aloj_dir_pais_nombre;
		this.res_id = res_id;
		this.anf_id = anf_id;
		this.anf_calificacion = anf_calificacion;
		this.hu_calificacion = hu_calificacion;
	}

	public int getAloj_id() {
		return aloj_id;
	}

	public void setAloj_id(int aloj_id) {
		this.aloj_id = aloj_id;
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

	public String getAloj_descripcion() {
		return aloj_descripcion;
	}

	public void setAloj_descripcion(String aloj_descripcion) {
		this.aloj_descripcion = aloj_descripcion;
	}

	public String getAloj_dir_calle() {
		return aloj_dir_calle;
	}

	public void setAloj_dir_calle(String aloj_dir_calle) {
		this.aloj_dir_calle = aloj_dir_calle;
	}

	public String getAloj_dir_numero() {
		return aloj_dir_numero;
	}

	public void setAloj_dir_numero(String aloj_dir_numero) {
		this.aloj_dir_numero = aloj_dir_numero;
	}

	public String getAloj_dir_ciudad() {
		return aloj_dir_ciudad;
	}

	public void setAloj_dir_ciudad(String aloj_dir_ciudad) {
		this.aloj_dir_ciudad = aloj_dir_ciudad;
	}

	public int getAloj_dir_pais_id() {
		return aloj_dir_pais_id;
	}

	public void setAloj_dir_pais_id(int aloj_dir_pais_id) {
		this.aloj_dir_pais_id = aloj_dir_pais_id;
	}

	public String getAloj_dir_pais_nombre() {
		return aloj_dir_pais_nombre;
	}

	public void setAloj_dir_pais_nombre(String aloj_dir_pais_nombre) {
		this.aloj_dir_pais_nombre = aloj_dir_pais_nombre;
	}

	public int getRes_id() {
		return res_id;
	}

	public void setRes_id(int res_id) {
		this.res_id = res_id;
	}

	public int getAnf_id() {
		return anf_id;
	}

	public void setAnf_id(int anf_id) {
		this.anf_id = anf_id;
	}

	public Integer getAnf_calificacion() {
		return anf_calificacion;
	}

	public void setAnf_calificacion(Integer anf_calificacion) {
		this.anf_calificacion = anf_calificacion;
	}

	public Integer getHu_calificacion() {
		return hu_calificacion;
	}

	public void setHu_calificacion(Integer hu_calificacion) {
		this.hu_calificacion = hu_calificacion;
	}
	
	
	
}