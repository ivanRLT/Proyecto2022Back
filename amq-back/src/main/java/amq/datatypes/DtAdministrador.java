/**
 * 
 */
package amq.datatypes;

public class DtAdministrador {
	
	private String email;
	private String nombre;
	private String apellido;
	private boolean activo;
	/**
	 * @param email
	 * @param nombre
	 * @param apellido
	 * @param activo
	 */
	public DtAdministrador(String email, String nombre, String apellido, boolean activo) {
		super();
		this.email = email;
		this.nombre = nombre;
		this.apellido = apellido;
		this.activo = activo;
	}
	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}
	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}
	/**
	 * @return the nombre
	 */
	public String getNombre() {
		return nombre;
	}
	/**
	 * @param nombre the nombre to set
	 */
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	/**
	 * @return the apellido
	 */
	public String getApellido() {
		return apellido;
	}
	/**
	 * @param apellido the apellido to set
	 */
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}
	/**
	 * @return the activo
	 */
	public boolean isActivo() {
		return activo;
	}
	/**
	 * @param activo the activo to set
	 */
	public void setActivo(boolean activo) {
		this.activo = activo;
	}

}
