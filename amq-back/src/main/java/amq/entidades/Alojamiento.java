package amq.entidades;

public class Alojamiento {
	private int id;
	private Boolean activo;
	private String descripcion;
	//private DtDireccion direccion; TODO
	private String nombre;
	//private List<Habitacion> habitaciones = new ArrayList<Habitacion>(); TODO
	
	public Alojamiento() {
		super();
	}
	public Alojamiento(int id, Boolean activo, String descripcion, String nombre) {
		super();
		this.id = id;
		this.activo = activo;
		this.descripcion = descripcion;
		this.nombre = nombre;
		//this.direccion = direccion; TODO
		//this.habitaciones = habitaciones; TODO
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Boolean getActivo() {
		return activo;
	}
	public void setActivo(Boolean activo) {
		this.activo = activo;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	//TODO seter y getter direccion
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	//TODO setter y getters habitaciones
}
