package amq.interfacescontroladores;

import java.util.List;

import amq.datatypes.DtCalificacion;
import amq.datatypes.DtFactura;

public interface IcReserva {
	public boolean altaReserva();
	public boolean modificarReserva();
	public void buscarReserva(int id);
	public boolean altaCalificacion();
	public boolean modificarCalificacion(int idReserva);
	public DtCalificacion listarCalificacion(int idReserva);
	public boolean altaFactura();
	public boolean modificarFactura(int idReserva, int idFactura);
	public DtFactura buscarFactura(int idReserva, int idFactura);
	public List<DtFactura> listarFacturas(int idReserva);
}
