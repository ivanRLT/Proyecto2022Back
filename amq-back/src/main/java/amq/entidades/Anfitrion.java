package amq.entidades;

import java.util.ArrayList;
import java.util.List;

import amq.enums.AprobacionEstado;

public class Anfitrion extends Usuario {
	private int calificacionGlobal;
	private AprobacionEstado estado;
	private List<Alojamiento> alojamientos = new ArrayList<Alojamiento>();
	
	public Anfitrion() {
		super();
	}
	public Anfitrion(String email, Boolean activo, String apellido, String nombre, int calificacion, List<Alojamiento> alojamientos, AprobacionEstado estado) {
		super(email, activo, apellido, nombre);
		this.calificacionGlobal = calificacion;
		this.estado = estado;
		this.alojamientos = alojamientos;
	}
	public int getCalificacionGlobal() {
		return calificacionGlobal;
	}
	public void setCalificacionGlobal(int calificacionGlobal) {
		this.calificacionGlobal = calificacionGlobal;
	}
	public AprobacionEstado getEstado() {
		return estado;
	}
	public void setEstado(AprobacionEstado estado) {
		this.estado = estado;
	}
	public List<Alojamiento> getAlojamientos() {
		return alojamientos;
	}
	public void setAlojamientos(List<Alojamiento> alojamientos) {
		this.alojamientos = alojamientos;
	}
	public void addAlojamiento(Alojamiento alojamiento) {
		this.alojamientos.add(alojamiento);
	}
}
