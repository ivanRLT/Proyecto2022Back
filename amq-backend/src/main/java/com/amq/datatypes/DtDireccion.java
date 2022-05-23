package com.amq.datatypes;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class DtDireccion {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String calle;
	private String numero;
	private String ciudad;
	private String pais;
	
	public DtDireccion(String calle, String numero, String ciudad, String pais) {
		super();
		this.calle = calle;
		this.numero = numero;
		this.ciudad = ciudad;
		this.pais = pais;
	}
	
    public int getId() {
        return id;
    }
	public String getCalle() {
		return calle;
	}

	public void setCalle(String calle) {
		this.calle = calle;
	}

	public String getNumero() {
		return numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	public String getCiudad() {
		return ciudad;
	}

	public void setCiudad(String ciudad) {
		this.ciudad = ciudad;
	}

	public String getPais() {
		return pais;
	}

	public void setPais(String pais) {
		this.pais = pais;
	}

}
