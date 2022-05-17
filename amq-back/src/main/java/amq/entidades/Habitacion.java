package amq.entidades;

import java.util.ArrayList;

public class Habitacion {
	private int id;
	private String descripcion;
	private Double precioNoche;
	private int camas;
	//private DtServicios servicios; TODO
	//private List<Reserva> reservas = new ArrayList<Reserva>(); TODO
	
	public Habitacion() {
		super();
	}
	public Habitacion(int id, String descripcion, Double precioNoche, int camas) {
		super();
		this.id = id;
		this.descripcion = descripcion;
		this.precioNoche = precioNoche;
		this.camas = camas;
		//this.servicios = servicios; TODO
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public Double getPrecioNoche() {
		return precioNoche;
	}
	public void setPrecioNoche(Double precioNoche) {
		this.precioNoche = precioNoche;
	}
	public int getCamas() {
		return camas;
	}
	public void setCamas(int camas) {
		this.camas = camas;
	}
	// TODO get y set servicios
	// TODO get y ser reservas
}
