package com.amq.datatypes;

public class DtAdministrador extends DtUsuario{
	

	public DtAdministrador() {
		super();
		// TODO Auto-generated constructor stub
	}

	public DtAdministrador(int id, String email, String nombre, String apellido, boolean activo, String tipo, boolean bloqueado,String jwToken) {
		super(id, email, nombre, apellido, activo, bloqueado,tipo,null, jwToken);
	}
}
