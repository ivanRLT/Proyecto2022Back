package com.amq.model;

import com.amq.controller.*;
import com.amq.icontroller.*;

public class Fabrica {
private static Fabrica instancia = null;
	
	private Fabrica(){}
	
	public static Fabrica getInstancia() {
		if (instancia == null)
			instancia = new Fabrica();
		return instancia;
	}
	
	public IcAlojamiento getIControladorAlojamiento() {
		return new ControladorAlojamiento();
	}
	
	public IcReserva getIControladorReserva() {
		return new ControladorReserva();
	}
	
	public IcUsuario getIControladorUsuario() {
		return new ControladorUsuario();
	}
}
