package com.amq.icontroller;

import java.util.List;

import com.amq.datatypes.DtCalificacion;
import com.amq.datatypes.DtFactura;
import com.amq.datatypes.DtReserva;
import com.amq.model.Reserva;

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
	public List<DtReserva> obtenerDtReservas(List<Reserva> rs);
}
