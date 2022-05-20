package amq.datatypes;

import java.util.List;

public class DtHuesped extends DtUsuario{
	
	
	private int calificacionGlobal;
	private List<String> pushToken;
	private List<DtReserva> reservas;

	public DtHuesped(String email, String nombre, String apellido, boolean activo, int calificacionGlobal, List<String> pushToken, List<DtReserva> reservas) {
		super(email, nombre, apellido, activo);
		this.calificacionGlobal = calificacionGlobal;
		this.pushToken = pushToken;
		this.reservas = reservas;
	}
	public int getCalificacionGlobal() {
		return calificacionGlobal;
	}
	public void setCalificacionGlobal(int calificacionGlobal) {
		this.calificacionGlobal = calificacionGlobal;
	}
	public List<String> getPushToken() {
		return pushToken;
	}
	public void setPushToken(List<String> pushToken) {
		this.pushToken = pushToken;
	}
	public List<DtReserva> getReservas() {
		return reservas;
	}
	public void setReservas(List<DtReserva> reservas) {
		this.reservas = reservas;
	}
}
