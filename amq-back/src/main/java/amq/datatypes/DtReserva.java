package amq.datatypes;

import java.util.ArrayList;
import java.util.Date;

import amq.entidades.Habitacion;

public class DtReserva {
	
	private boolean estado;
	private Date fechaInicio;
	private Date fechaFin;
	private int idChat;
	private int cantidadDias;
	private ArrayList<amq.entidades.Habitacion> habitaciones;
	
	/**
	 * @param estado
	 * @param fechaInicio
	 * @param fechaFin
	 * @param idChat
	 * @param cantidadDias
	 * @param habitaciones
	 */
	public DtReserva(boolean estado, Date fechaInicio, Date fechaFin, int idChat, int cantidadDias,
			ArrayList<Habitacion> habitaciones) {
		super();
		this.estado = estado;
		this.fechaInicio = fechaInicio;
		this.fechaFin = fechaFin;
		this.idChat = idChat;
		this.cantidadDias = cantidadDias;
		this.habitaciones = habitaciones;
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
	 * @return the habitaciones
	 */
	public ArrayList<amq.entidades.Habitacion> getHabitaciones() {
		return habitaciones;
	}

	/**
	 * @param habitaciones the habitaciones to set
	 */
	public void setHabitaciones(ArrayList<amq.entidades.Habitacion> habitaciones) {
		this.habitaciones = habitaciones;
	}

}
