package amq.entidades;

import java.util.ArrayList;
import java.util.List;

import amq.datatypes.DtDireccion;

public class Alojamiento {
	private int id;
	private Boolean activo;
	private String descripcion;
	private DtDireccion direccion;
	private String nombre;
	private List<Habitacion> habitaciones = new ArrayList<Habitacion>();
	
	public Alojamiento() {
		super();
	}
	public Alojamiento(int id, Boolean activo, String descripcion, String nombre, DtDireccion direccion, List<Habitacion> habitaciones) {
		super();
		this.id = id;
		this.activo = activo;
		this.descripcion = descripcion;
		this.nombre = nombre;
		this.direccion = direccion;
		this.habitaciones = habitaciones;
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
	public DtDireccion getDireccion() {
		return direccion;
	}
	public void setDireccion(DtDireccion direccion) {
		this.direccion = direccion;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public List<Habitacion> getHabitaciones() {
		return habitaciones;
	}
	public void setHabitaciones(List<Habitacion> habitaciones) {
		this.habitaciones = habitaciones;
	}
}
