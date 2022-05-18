package amq.entidades;

import java.util.ArrayList;
import java.util.List;

public class Anfitrion extends Usuario {
	private int calificacionGlobal;
	//private EstadoAprobacion estado; TODO
	private List<Alojamiento> alojamientos = new ArrayList<Alojamiento>();
	
	public Anfitrion() {
		super();
	}
	public Anfitrion(String email, Boolean activo, String apellido, String nombre, int calificacion, List<Alojamiento> alojamientos) {
		super(email, activo, apellido, nombre);
		this.calificacionGlobal = calificacion;
		//this.estado = estado; TODO
		this.alojamientos = alojamientos;
	}
	public int getCalificacionGlobal() {
		return calificacionGlobal;
	}
	public void setCalificacionGlobal(int calificacionGlobal) {
		this.calificacionGlobal = calificacionGlobal;
	}
	// TODO set y get de estado
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
