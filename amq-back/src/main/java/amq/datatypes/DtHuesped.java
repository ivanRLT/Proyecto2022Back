package amq.datatypes;

import java.util.List;

public class DtHuesped extends DtUsuario{
	
	
	private int calificacionGlobal;
	private List<String> pushToken;

	public DtHuesped(String email, String nombre, String apellido, boolean activo, int calificacionGlobal, List<String> pushToken) {
		super(email, nombre, apellido, activo);
		this.calificacionGlobal = calificacionGlobal;
		this.pushToken = pushToken;
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
}
