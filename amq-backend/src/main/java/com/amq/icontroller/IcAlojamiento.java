package com.amq.icontroller;

import java.util.List;

import com.amq.datatypes.DtAlojamiento;
import com.amq.datatypes.DtHabitacion;
import com.amq.model.Alojamiento;

public interface IcAlojamiento {
	public Alojamiento altaAlojamiento(DtAlojamiento alojamiento, List<DtHabitacion> habitaciones);
	public boolean modificarAlojamiento();
	public void buscarAlojamiento(int id);
	public Boolean desactivarAlojamiento();
	public DtAlojamiento listarAlojamientos();
	public Boolean agregarHabitaciones(int idAlojamiento, List<DtHabitacion> dtHabitacion);
	public DtHabitacion consultaHabitacion(int idAlojamiento, int idHabitacion);
	public List<DtHabitacion> listarHabitaciones(int idAlojamiento);
	public Boolean modificarHabitaciones(int idAlojamiento, List<DtHabitacion> dtHabitacion);
}
