package com.amq.datatypes;

import com.amq.model.Alojamiento;
import com.amq.model.Habitacion;
import com.amq.model.Reserva;

public class DtReservaAlojamiento {
	
	private Reserva reserva;
	private Alojamiento alojamiento;
	private Habitacion habitacion;
	
	
	public DtReservaAlojamiento() {	super(); }

	public DtReservaAlojamiento( Reserva reserva, Alojamiento alojamiento, Habitacion habitacion) {
		super();
		this.alojamiento = alojamiento;
		this.reserva = reserva;
		this.habitacion = habitacion;
	}
	
	public Alojamiento getAlojamiento() {
		return alojamiento;
	}
	public void setAlojamiento(Alojamiento alojamiento) {
		this.alojamiento = alojamiento;
	}
	public Reserva getReserva() {
		return reserva;
	}
	public void setReserva(Reserva reserva) {
		this.reserva = reserva;
	}
	public Habitacion getHabitacion() {
		return habitacion;
	}
	public void setHabitacion(Habitacion habitacion) {
		this.habitacion = habitacion;
	}
	
	
	
}
