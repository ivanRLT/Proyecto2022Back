package amq.controladores;

import java.util.List;

import amq.datatypes.DtCalificacion;
import amq.datatypes.DtFactura;
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
