package amq.datatypes;

public class dtHuesped {
	
	private String email;
	private String nombre;
	private String apellido;
	private boolean activo;
	private int calificacionGlobal;
	private String pushToken;
	/**
	 * @param email
	 * @param nombre
	 * @param apellido
	 * @param activo
	 * @param calificacionGlobal
	 * @param pushToken
	 */
	public dtHuesped(String email, String nombre, String apellido, boolean activo, int calificacionGlobal,
			String pushToken) {
		super();
		this.email = email;
		this.nombre = nombre;
		this.apellido = apellido;
		this.activo = activo;
		this.calificacionGlobal = calificacionGlobal;
		this.pushToken = pushToken;
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
	/**
	 * @return the calificacionGlobal
	 */
	public int getCalificacionGlobal() {
		return calificacionGlobal;
	}
	/**
	 * @param calificacionGlobal the calificacionGlobal to set
	 */
	public void setCalificacionGlobal(int calificacionGlobal) {
		this.calificacionGlobal = calificacionGlobal;
	}
	/**
	 * @return the pushToken
	 */
	public String getPushToken() {
		return pushToken;
	}
	/**
	 * @param pushToken the pushToken to set
	 */
	public void setPushToken(String pushToken) {
		this.pushToken = pushToken;
	}
	
	

}
