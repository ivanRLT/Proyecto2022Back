package amq.interfacescontroladores;

import amq.datatypes.DtHabitacion;
import java.util.List;
import amq.datatypes.DtAlojamiento;

public interface IcAlojamiento {
	public boolean altaAlojamiento();
	public boolean modificarAlojamiento();
	public void buscarAlojamiento(int id);
	public Boolean desactivarAlojamiento();
	public DtAlojamiento listarAlojamientos();
	public Boolean agregarHabitaciones(int idAlojamiento, List<DtHabitacion> dtHabitacion);
	public DtHabitacion consultaHabitacion(int idAlojamiento, int idHabitacion);
	public List<DtHabitacion> listarHabitaciones(int idAlojamiento);
	public Boolean modificarHabitaciones(int idAlojamiento, List<DtHabitacion> dtHabitacion);
}
