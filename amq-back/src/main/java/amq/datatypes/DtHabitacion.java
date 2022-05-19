package amq.datatypes;

import java.util.ArrayList;

public class DtHabitacion {
	
	private String descripcion;
	private Double precioNoche;
	private int camas;
	private ArrayList<DtServicios> dtservicios;

	/**
	 * @param descripcion
	 * @param precioNoche
	 * @param camas
	 * @param dtservicios
	 */
	public DtHabitacion(String descripcion, Double precioNoche, int camas, ArrayList<DtServicios> dtservicios) {
		super();
		this.descripcion = descripcion;
		this.precioNoche = precioNoche;
		this.camas = camas;
		this.dtservicios = dtservicios;
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
	public ArrayList<DtServicios> getDtservicios() {
		return dtservicios;
	}

	/**
	 * @param dtservicios the dtservicios to set
	 */
	public void setDtservicios(ArrayList<DtServicios> dtservicios) {
		this.dtservicios = dtservicios;
	}

}
