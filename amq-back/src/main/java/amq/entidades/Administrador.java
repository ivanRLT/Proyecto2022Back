package amq.entidades;

public class Administrador extends Usuario {
	public Administrador() {
		super();
	}
	public Administrador(String email, Boolean activo, String apellido, String nombre) {
		super(email, activo, apellido, nombre);
	}
}
