package amq.interfacescontroladores;

public interface IcReserva {
	public boolean altaReserva();
	public boolean modificarReserva();
	public void buscarReserva(int id);
	public boolean altaCalificacion();
	public boolean modificarCalificacion(int idReserva);
	public void listarCalificacion(int idReserva);
	public boolean altaFactura();
	public boolean modificarFactura(int idReserva, int idFactura);
	public void buscarFactura(int idReserva, int idFactura);
	public void listarFacturas(int idReserva);
}
