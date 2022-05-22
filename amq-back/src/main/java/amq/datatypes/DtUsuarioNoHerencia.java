package amq.datatypes;

import amq.enums.AprobacionEstado;

public abstract class DtUsuarioNoHerencia {
	private String usr_tipo;
	private String usr_email;
	private String usr_nombre;
	private String usr_apellido;
	private boolean usr_activo;
	
	private int anf_calificacionGlobal;
	private AprobacionEstado anf_estado;
	
	private int hu_calificacionGlobal;
	
}
