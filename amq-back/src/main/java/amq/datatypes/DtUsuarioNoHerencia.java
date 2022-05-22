package amq.datatypes;

import amq.enums.AprobacionEstado;
import amq.enums.TipoUsuario;

public class DtUsuarioNoHerencia {
	private TipoUsuario usr_tipo;
	private String usr_email;
	private String usr_nombre;
	private String usr_apellido;
	private boolean usr_activo;
	
	public DtUsuarioNoHerencia(TipoUsuario usr_tipo, String usr_email, String usr_nombre, String usr_apellido,
			boolean usr_activo, int anf_calificacionGlobal, AprobacionEstado anf_estado, int hu_calificacionGlobal) {
		super();
		this.usr_tipo = usr_tipo;
		this.usr_email = usr_email;
		this.usr_nombre = usr_nombre;
		this.usr_apellido = usr_apellido;
		this.usr_activo = usr_activo;
		this.anf_calificacionGlobal = anf_calificacionGlobal;
		this.anf_estado = anf_estado;
		this.hu_calificacionGlobal = hu_calificacionGlobal;
	}

	private int anf_calificacionGlobal;
	private AprobacionEstado anf_estado;
	
	private int hu_calificacionGlobal;

	public TipoUsuario getUsr_tipo() {
		return usr_tipo;
	}

	public void setUsr_tipo(TipoUsuario usr_tipo) {
		this.usr_tipo = usr_tipo;
	}

	public String getUsr_email() {
		return usr_email;
	}

	public void setUsr_email(String usr_email) {
		this.usr_email = usr_email;
	}

	public String getUsr_nombre() {
		return usr_nombre;
	}

	public void setUsr_nombre(String usr_nombre) {
		this.usr_nombre = usr_nombre;
	}

	public String getUsr_apellido() {
		return usr_apellido;
	}

	public void setUsr_apellido(String usr_apellido) {
		this.usr_apellido = usr_apellido;
	}

	public boolean isUsr_activo() {
		return usr_activo;
	}

	public void setUsr_activo(boolean usr_activo) {
		this.usr_activo = usr_activo;
	}

	public int getAnf_calificacionGlobal() {
		return anf_calificacionGlobal;
	}

	public void setAnf_calificacionGlobal(int anf_calificacionGlobal) {
		this.anf_calificacionGlobal = anf_calificacionGlobal;
	}

	public AprobacionEstado getAnf_estado() {
		return anf_estado;
	}

	public void setAnf_estado(AprobacionEstado anf_estado) {
		this.anf_estado = anf_estado;
	}

	public int getHu_calificacionGlobal() {
		return hu_calificacionGlobal;
	}

	public void setHu_calificacionGlobal(int hu_calificacionGlobal) {
		this.hu_calificacionGlobal = hu_calificacionGlobal;
	}
	
	public String[] toArray() {
		String[] arrRes = new String[8];
		
		arrRes[0] = (this.usr_tipo != null) ?  this.usr_tipo.toString() : "";
		arrRes[1] = this.usr_email ;
		arrRes[2] = this.usr_nombre ;
		arrRes[3] = this.usr_apellido ;
		arrRes[4] = Boolean.toString( this.usr_activo );;
		arrRes[5] = Integer.toString( this.anf_calificacionGlobal );
		arrRes[6] = (this.anf_estado != null) ? this.anf_estado.toString() : "";
		arrRes[7] = Integer.toString(this.hu_calificacionGlobal) ;
		
		return arrRes;
	}
}
