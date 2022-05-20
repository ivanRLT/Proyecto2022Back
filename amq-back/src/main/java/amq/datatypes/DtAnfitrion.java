package amq.datatypes;

import java.util.ArrayList;
import java.util.List;

import amq.enums.AprobacionEstado;

public class DtAnfitrion extends DtUsuario {
	
	private int calificacionGlobal;
	private AprobacionEstado estado;
	private List<DtAlojamiento> alojamientos = new ArrayList<DtAlojamiento>();

	public DtAnfitrion(String email, String nombre, String apellido, boolean activo, int calificacionGlobal, AprobacionEstado estado, List<DtAlojamiento> alojamientos) {
		super(email, nombre, apellido, activo);
		this.calificacionGlobal = calificacionGlobal;
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
	public List<DtAlojamiento> getAlojamientos() {
		return alojamientos;
	}
	public void setAlojamientos(List<DtAlojamiento> alojamientos) {
		this.alojamientos = alojamientos;
	}
}
