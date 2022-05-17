package amq.entidades;

public class Calificacion {
	private int id;
	private int calificacionAnfitrion;
	private int calificacionHuesped;
	private String resena;
	//private DtFecha fechaResena; TODO
	
	public Calificacion() {
		super();
	}
	public Calificacion(int id, int calificacionAnfitrion, int calificacionHuesped, String resena) {
		super();
		this.id = id;
		this.calificacionAnfitrion = calificacionAnfitrion;
		this.calificacionHuesped = calificacionHuesped;
		this.resena = resena;
		//this.fechaResena = fechaResena; TODO
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
	// TODO get y set fecha reseña
	
}
