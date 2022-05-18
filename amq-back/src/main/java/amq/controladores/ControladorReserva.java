package amq.controladores;

import amq.interfacescontroladores.IcReserva;
import amq.manejadores.ManejadorReserva;

public class ControladorReserva implements IcReserva{
	public boolean altaReserva() {
		Boolean retorno = false;
		try {
			ManejadorReserva mR = ManejadorReserva.getInstancia();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return retorno;
	}
	public boolean modificarReserva() {
		Boolean retorno = false;
		try {
			ManejadorReserva mR = ManejadorReserva.getInstancia();
		} catch (Exception e) {
			// TODO: handle exception
		}	
		return retorno;
	}
	public void buscarReserva(int id) {
		try {
			ManejadorReserva mR = ManejadorReserva.getInstancia();
		} catch (Exception e) {
			// TODO: handle exception
		}
		//retono Dt
	}
	// #######################Funciones de Calificacion#######################
	public boolean altaCalificacion() {
		Boolean retorno = false;
		try {
			ManejadorReserva mR = ManejadorReserva.getInstancia();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return retorno;
	}
	public boolean modificarCalificacion(int idReserva) {
		Boolean retorno = false;
		try {
			ManejadorReserva mR = ManejadorReserva.getInstancia();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return retorno;
	}
	public void listarCalificacion(int idReserva) {
		try {
			ManejadorReserva mR = ManejadorReserva.getInstancia();
		} catch (Exception e) {
			// TODO: handle exception
		}
		//TODO retorno dtCalificacion
	}
	// #######################Funciones de Facturas#######################
		public boolean altaFactura() {
			Boolean retorno = false;
			try {
				ManejadorReserva mR = ManejadorReserva.getInstancia();
			} catch (Exception e) {
				// TODO: handle exception
			}
			return retorno;
		}
		public boolean modificarFactura(int idReserva, int idFactura) {
			Boolean retorno = false;
			try {
				ManejadorReserva mR = ManejadorReserva.getInstancia();
			} catch (Exception e) {
				// TODO: handle exception
			}
			return retorno;
		}
		public void buscarFactura(int idReserva, int idFactura) {
			try {
				ManejadorReserva mR = ManejadorReserva.getInstancia();
			} catch (Exception e) {
				// TODO: handle exception
			}
			//TODO retorno dtFactura
		}
		public void listarFacturas(int idReserva) {
			try {
				ManejadorReserva mR = ManejadorReserva.getInstancia();
			} catch (Exception e) {
				// TODO: handle exception
			}
			//TODO retorno list dtFactura
		}
}
