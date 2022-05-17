package amq.entidades;

public class Reserva {
	private int id;
	//private EstadoReserva estado; TODO
	//private DtFecha fechaInicio; TODO
	//private DtFecha fechaFin; TODO
	private String idChat;
	private int cantDias;
	//private Calificacion calificacion; TODO
	//private List<Factura> facturas = new ArrayList<Factura>(); TODO
	
	public Reserva() {
		super();
	}
	public Reserva(int id, String idChat, int cantDias) {
		super();
		this.id = id;
		this.idChat = idChat;
		this.cantDias = cantDias;
		//this.estado = estado; TODO
		//this.fechaInicio = fechaInicio; TODO
		//this.fechaFin = fechaFin; TODO
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getIdChat() {
		return idChat;
	}
	public void setIdChat(String idChat) {
		this.idChat = idChat;
	}
	public int getCantDias() {
		return cantDias;
	}
	public void setCantDias(int cantDias) {
		this.cantDias = cantDias;
	}
	// TODO get y set estado
	// TODO get y set fechainicio
	// TODO get y set fechafin
	// TODO get y set calificacion
	// TODO get y set facturas
}
