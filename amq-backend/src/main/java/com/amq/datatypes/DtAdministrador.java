package com.amq.datatypes;

public class DtAdministrador extends DtUsuario{
	

	public DtAdministrador() {
		super();
		// TODO Auto-generated constructor stub
	}

	public DtAdministrador(int id, String email, String nombre, String apellido, boolean activo, boolean bloqueado,String jwToken, String tipo) {
		super(id, email, nombre, apellido, activo, activo,tipo, jwToken);
	}
}
