package amq.interfacescontroladores;

public interface IcAlojamiento {
	public boolean altaAlojamiento();
	public boolean modificarAlojamiento();
	public void buscarAlojamiento(int id);
	public Boolean desactivarAlojamiento();
	public void listarAlojamientos();
	public Boolean agregarHabitaciones(int idAlojamiento, String dtHabitacion);
	public Boolean consultaHabitacion(int idAlojamiento, int idHabitacion);
	public Boolean listarHabitaciones(int idAlojamiento);
	public Boolean modificarHabitaciones(int idAlojamiento, String dtHabitacion);
}
