package amq.datatypes;

public abstract class DtUsuario {
	private String email;
	private String nombre;
	private String apellido;
	private boolean activo;
	
	public DtUsuario(String email, String nombre, String apellido, boolean activo) {
		super();
		this.email = email;
		this.nombre = nombre;
		this.apellido = apellido;
		this.activo = activo;
	}
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public boolean isActivo() {
		return activo;
	}

	public void setActivo(boolean activo) {
		this.activo = activo;
	}
}
