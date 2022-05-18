package amq.interfacescontroladores;

public interface IcUsuario {
	public boolean altaUsuario();
	public boolean modificarUsuario();
	public void buscarUsuario(int id, String email);
	public boolean desactivarUsuario();
	public boolean agregarAlojamientoAnfitrion();
	public void listarAlojamientosAnfitrion();
	public boolean cambiarEstadoAnfitrion();
	public boolean agregarReservaHuesped();
	public void listarReservasHuesped();
	public boolean modificarReservaHuesped(int idReserva);
}
