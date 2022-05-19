package amq.entidades;

import amq.datatypes.DtFecha;

public class Calificacion {
	private int id;
	private int calificacionAnfitrion;
	private int calificacionHuesped;
	private String resena;
	private DtFecha fechaResena;
	
	public Calificacion() {
		super();
	}
	public Calificacion(int id, int calificacionAnfitrion, int calificacionHuesped, String resena, DtFecha fecha) {
		super();
		this.id = id;
		this.calificacionAnfitrion = calificacionAnfitrion;
		this.calificacionHuesped = calificacionHuesped;
		this.resena = resena;
		this.fechaResena = fecha;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCalificacionAnfitrion() {
		return calificacionAnfitrion;
	}
	public void setCalificacionAnfitrion(int calificacionAnfitrion) {
		this.calificacionAnfitrion = calificacionAnfitrion;
	}
	public int getCalificacionHuesped() {
		return calificacionHuesped;
	}
	public void setCalificacionHuesped(int calificacionHuesped) {
		this.calificacionHuesped = calificacionHuesped;
	}
	public String getResena() {
		return resena;
	}
	public void setResena(String resena) {
		this.resena = resena;
	}
	public DtFecha getFechaResena() {
		return fechaResena;
	}
	public void setFechaResena(DtFecha fechaResena) {
		this.fechaResena = fechaResena;
	}
}
