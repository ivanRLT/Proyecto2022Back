package com.amq.model;

import java.io.Serializable;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

@Entity
@DiscriminatorValue("Ad")
public class Administrador extends Usuario implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public Administrador() {
		super();
	}
	public Administrador(String email, Boolean activo, String apellido, String nombre, String pass) {
		super(email, activo, apellido, nombre, pass);
	}
}
