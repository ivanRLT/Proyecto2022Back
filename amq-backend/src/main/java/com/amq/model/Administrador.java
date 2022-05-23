package com.amq.model;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

@Entity
@DiscriminatorValue("Ad")
public class Administrador extends Usuario {
	public Administrador() {
		super();
	}
	public Administrador(String email, Boolean activo, String apellido, String nombre, String pass) {
		super(email, activo, apellido, nombre, pass);
	}
}
