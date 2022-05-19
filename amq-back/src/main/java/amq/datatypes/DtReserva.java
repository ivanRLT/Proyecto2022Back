package amq.datatypes;

import java.util.ArrayList;
//import java.util.Collection;
import java.util.Date;

//import amq.entidades.Habitacion;

public class DtReserva {
	
	private boolean estado;
	private Date fechaInicio;
	private Date fechaFin;
	private int idChat;
	private int cantidadDias;
	//no estoy seguro si lleva a la entidad en lugar del dt.:
	//private ArrayList<amq.entidades.Habitacion> habitaciones;
	private ArrayList<DtHabitacion> dtHabitacion;
//	dejo esto preparado para usar a futuro por si complica los rest.:
//	private Collection<DtHabitacion> coleccionHabitaciones = new ArrayList<>();
	private ArrayList<DtFactura> dtFactura;
	private DtCalificacion dtCalificacion;
	


	/**
	 * @param estado
	 * @param fechaInicio
	 * @param fechaFin
	 * @param idChat
	 * @param cantidadDias
	 * @param dtHabitacion
	 * @param dtFactura
	 * @param dtCalificacion
	 */
	public DtReserva(boolean estado, Date fechaInicio, Date fechaFin, int idChat, int cantidadDias,
			ArrayList<DtHabitacion> dtHabitacion, ArrayList<DtFactura> dtFactura, DtCalificacion dtCalificacion) {
		super();
		this.estado = estado;
		this.fechaInicio = fechaInicio;
		this.fechaFin = fechaFin;
		this.idChat = idChat;
		this.cantidadDias = cantidadDias;
		this.dtHabitacion = dtHabitacion;
		this.dtFactura = dtFactura;
		this.dtCalificacion = dtCalificacion;
	}

	/**
	 * @return the estado
	 */
	public boolean isEstado() {
		return estado;
	}

	/**
	 * @param estado the estado to set
	 */
	public void setEstado(boolean estado) {
		this.estado = estado;
	}

	/**
	 * @return the fechaInicio
	 */
	public Date getFechaInicio() {
		return fechaInicio;
	}

	/**
	 * @param fechaInicio the fechaInicio to set
	 */
	public void setFechaInicio(Date fechaInicio) {
		this.fechaInicio = fechaInicio;
	}

	/**
	 * @return the fechaFin
	 */
	public Date getFechaFin() {
		return fechaFin;
	}

	/**
	 * @param fechaFin the fechaFin to set
	 */
	public void setFechaFin(Date fechaFin) {
		this.fechaFin = fechaFin;
	}

	/**
	 * @return the idChat
	 */
	public int getIdChat() {
		return idChat;
	}

	/**
	 * @param idChat the idChat to set
	 */
	public void setIdChat(int idChat) {
		this.idChat = idChat;
	}

	/**
	 * @return the cantidadDias
	 */
	public int getCantidadDias() {
		return cantidadDias;
	}

	/**
	 * @param cantidadDias the cantidadDias to set
	 */
	public void setCantidadDias(int cantidadDias) {
		this.cantidadDias = cantidadDias;
	}

	/**
	 * @return the dtHabitacion
	 */
	public ArrayList<DtHabitacion> getDtHabitacion() {
		return dtHabitacion;
	}

	/**
	 * @param dtHabitacion the dtHabitacion to set
	 */
	public void setDtHabitacion(ArrayList<DtHabitacion> dtHabitacion) {
		this.dtHabitacion = dtHabitacion;
	}

	/**
	 * @return the dtFactura
	 */
	public ArrayList<DtFactura> getDtFactura() {
		return dtFactura;
	}

	/**
	 * @param dtFactura the dtFactura to set
	 */
	public void setDtFactura(ArrayList<DtFactura> dtFactura) {
		this.dtFactura = dtFactura;
	}

	/**
	 * @return the dtCalificacion
	 */
	public DtCalificacion getDtCalificacion() {
		return dtCalificacion;
	}

	/**
	 * @param dtCalificacion the dtCalificacion to set
	 */
	public void setDtCalificacion(DtCalificacion dtCalificacion) {
		this.dtCalificacion = dtCalificacion;
	}

//	/**
//	 * @return the habitaciones
//	 */
//	public ArrayList<amq.entidades.Habitacion> getHabitaciones() {
//		return habitaciones;
//	}
//
//	/**
//	 * @param habitaciones the habitaciones to set
//	 */
//	public void setHabitaciones(ArrayList<amq.entidades.Habitacion> habitaciones) {
//		this.habitaciones = habitaciones;
//	}
	
	

}
