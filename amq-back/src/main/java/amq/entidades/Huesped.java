package amq.entidades;

import java.util.ArrayList;
import java.util.List;

public class Huesped extends Usuario{
	private int calificacionGlobal;
	private List<String> pushTokens = new ArrayList<String>();
	private List<Reserva> reservas = new ArrayList<Reserva>();
	
	public Huesped() {
		super();
	}
	public Huesped(String email, Boolean activo, String apellido, String nombre, int calificacion, List<String> tokens) {
		super(email, activo, apellido, nombre);
		this.calificacionGlobal = calificacion;
		this.pushTokens = tokens;
	}
	public int getCalificacionGlobal() {
		return calificacionGlobal;
	}
	public void setCalificacionGlobal(int calificacionGlobal) {
		this.calificacionGlobal = calificacionGlobal;
	}
	public List<String> getPushTokens() {
		return pushTokens;
	}
	public void setPushTokens(List<String> pushTokens) {
		this.pushTokens = pushTokens;
	}
	public List<Reserva> getReservas() {
		return reservas;
	}
	public void setReservas(List<Reserva> reservas) {
		this.reservas = reservas;
	}
	public void addReserva(Reserva reservas) {
		this.reservas.add(reservas);
	}
}
