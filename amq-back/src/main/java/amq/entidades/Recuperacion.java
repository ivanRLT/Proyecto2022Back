package amq.entidades;

import amq.datatypes.DtFecha;

public class Recuperacion {
	private int id;
	private DtFecha fecha;

	public Recuperacion() {
		super();
	}
	public Recuperacion(int id, DtFecha fecha) {
		super();
		this.id = id;
		this.fecha = fecha;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public DtFecha getFecha() {
		return fecha;
	}
	public void setFecha(DtFecha fecha) {
		this.fecha = fecha;
	}
}
