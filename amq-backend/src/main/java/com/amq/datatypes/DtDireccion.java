package com.amq.datatypes;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

import org.hibernate.annotations.BatchSize;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

@Entity
public class DtDireccion {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String calle;
	private String numero;
	private String ciudad;
	@OneToOne   
	@JoinColumn(name = "pais", referencedColumnName = "id")
	@Fetch(FetchMode.SELECT)
	@BatchSize(size=100)
	private DtPais pais;
	
	public DtDireccion() {}
	
	public DtDireccion(String calle, String numero, String ciudad, DtPais pais) {
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

	public DtPais getPais() {
		return pais;
	}

	public void setPais(DtPais pais) {
		this.pais = pais;
	}

}
