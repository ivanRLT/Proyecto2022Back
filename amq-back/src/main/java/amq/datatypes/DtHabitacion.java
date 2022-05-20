package amq.datatypes;

import java.util.ArrayList;

public class DtHabitacion {
	
	private String descripcion;
	private Double precioNoche;
	private int camas;
	private DtServicios dtservicios;
	private ArrayList<DtReserva> dtReservas;
//	dejo esto preparado para usar a futuro por si complica los rest.:
//	private Collection<DtHabitacion> coleccionHabitaciones = new ArrayList<>();
	
//	no estoy seguro si lleva a la entidad en lugar del dt.:
//	private ArrayList<amq.entidades.Habitacion> habitaciones;
	
	/**
	 * @param descripcion
	 * @param precioNoche
	 * @param camas
	 * @param dtservicios
	 * @param dtReservas
	 */
	public DtHabitacion(String descripcion, Double precioNoche, int camas, 
			DtServicios dtservicios,
			ArrayList<DtReserva> dtReservas) {
		super();
		this.descripcion = descripcion;
		this.precioNoche = precioNoche;
		this.camas = camas;
		this.dtservicios = dtservicios;
		this.dtReservas = dtReservas;
	}
	
	/**
	 * @return the descripcion
	 */
	public String getDescripcion() {
		return descripcion;
	}

	/**
	 * @param descripcion the descripcion to set
	 */
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	/**
	 * @return the precioNoche
	 */
	public Double getPrecioNoche() {
		return precioNoche;
	}
	/**
	 * @param precioNoche the precioNoche to set
	 */
	public void setPrecioNoche(Double precioNoche) {
		this.precioNoche = precioNoche;
	}
	/**
	 * @return the camas
	 */
	public int getCamas() {
		return camas;
	}
	/**
	 * @param camas the camas to set
	 */
	public void setCamas(int camas) {
		this.camas = camas;
	}
	/**
	 * @return the servicios
	 */

	/**
	 * @return the dtservicios
	 */
	public DtServicios getDtservicios() {
		return dtservicios;
	}

	/**
	 * @return the dtReservas
	 */
	public ArrayList<DtReserva> getDtReservas() {
		return dtReservas;
	}

	public void setDtservicios(DtServicios dtservicios) {
		this.dtservicios = dtservicios;
	}

	/**
	 * @param dtReservas the dtReservas to set
	 */
	public void setDtReservas(ArrayList<DtReserva> dtReservas) {
		this.dtReservas = dtReservas;
	}
	
	

}
