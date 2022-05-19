package amq.interfacescontroladores;

import java.util.List;

import amq.datatypes.DtReserva;
import amq.datatypes.DtUsuario;
import amq.datatypes.DtAlojamiento;

public interface IcUsuario {
	public boolean altaUsuario();
	public boolean modificarUsuario();
	public void buscarUsuario(int id, String email);
	public boolean desactivarUsuario();
	public List<DtUsuario> listarUsuarios ();
	public boolean agregarAlojamientoAnfitrion();
	public List<DtAlojamiento> listarAlojamientosAnfitrion();
	public boolean cambiarEstadoAnfitrion();
	public boolean agregarReservaHuesped();
	public List<DtReserva> listarReservasHuesped();
	public boolean modificarReservaHuesped(int idReserva);
}
