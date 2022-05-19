package amq.controladores;

import java.util.ArrayList;
import java.util.List;

import amq.datatypes.DtCalificacion;
import amq.datatypes.DtFactura;
import amq.datatypes.DtReserva;
import amq.entidades.Calificacion;
import amq.entidades.Factura;
import amq.entidades.Reserva;
import amq.interfacescontroladores.IcReserva;

public class ControladorReserva implements IcReserva{
	public boolean altaReserva() {
		Boolean retorno = false;
		try {

		} catch (Exception e) {
			// TODO: handle exception
		}
		return retorno;
	}
	public boolean modificarReserva() {
		Boolean retorno = false;
		try {

		} catch (Exception e) {
			// TODO: handle exception
		}	
		return retorno;
	}
	public void buscarReserva(int id) {
		try {

		} catch (Exception e) {
			// TODO: handle exception
		}
		//retono Dt
	}
	public List<DtReserva> obtenerDtReservas(List<Reserva> rs) {
		List<DtReserva> retorno = new ArrayList<DtReserva>();
		for(Reserva r:rs) {
			List<DtFactura> facturasdt = new ArrayList<DtFactura>();
			List<Factura> facturas = r.getFacturas();
			for(Factura f:facturas) {
				DtFactura fac = new DtFactura(f.getEstado(), f.getMonto(), f.getFecha(), f.getDescuento(), f.getMontoDescuento());
				facturasdt.add(fac);
			}
			Calificacion calif = r.getCalificacion();
			DtCalificacion califdt = new DtCalificacion(calif.getCalificacionAnfitrion(), calif.getCalificacionHuesped(), calif.getResena(), calif.getFechaResena());
			DtReserva reservadt = new DtReserva(r.getEstado(),r.getFechaInicio(),r.getFechaFin(),r.getIdChat(),r.getCantDias(), facturasdt, califdt);
			retorno.add(reservadt);
		}
		return retorno;
	}
	// #######################Funciones de Calificacion#######################
	public boolean altaCalificacion() {
		Boolean retorno = false;
		try {

		} catch (Exception e) {
			// TODO: handle exception
		}
		return retorno;
	}
	public boolean modificarCalificacion(int idReserva) {
		Boolean retorno = false;
		try {

		} catch (Exception e) {
			// TODO: handle exception
		}
		return retorno;
	}
	public DtCalificacion listarCalificacion(int idReserva) {
		try {

		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	// #######################Funciones de Facturas#######################
		public boolean altaFactura() {
			Boolean retorno = false;
			try {

			} catch (Exception e) {
				// TODO: handle exception
			}
			return retorno;
		}
		public boolean modificarFactura(int idReserva, int idFactura) {
			Boolean retorno = false;
			try {

			} catch (Exception e) {
				// TODO: handle exception
			}
			return retorno;
		}
		public DtFactura buscarFactura(int idReserva, int idFactura) {
			try {

			} catch (Exception e) {
				// TODO: handle exception
			}
			return null;
		}
		public List<DtFactura> listarFacturas(int idReserva) {
			try {

			} catch (Exception e) {
				// TODO: handle exception
			}
			return null;
		}
}
