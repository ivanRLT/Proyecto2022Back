package com.amq.datatypes;

public class DtCalificacion {
	
	private int calificacionAnfitrion;
	private int calificacionHuesped;
	private String resenia;
	private DtFecha dtfecha;
	/**
	 * @param calificacionAnfitrion
	 * @param calificacionHuesped
	 * @param resenia
	 * @param dtfecha
	 */
	public DtCalificacion(int calificacionAnfitrion, int calificacionHuesped, String resenia, DtFecha dtfecha) {
		super();
		this.calificacionAnfitrion = calificacionAnfitrion;
		this.calificacionHuesped = calificacionHuesped;
		this.resenia = resenia;
		this.dtfecha = dtfecha;
	}
	/**
	 * @return the calificacionAnfitrion
	 */
	public int getCalificacionAnfitrion() {
		return calificacionAnfitrion;
	}
	/**
	 * @param calificacionAnfitrion the calificacionAnfitrion to set
	 */
	public void setCalificacionAnfitrion(int calificacionAnfitrion) {
		this.calificacionAnfitrion = calificacionAnfitrion;
	}
	/**
	 * @return the calificacionHuesped
	 */
	public int getCalificacionHuesped() {
		return calificacionHuesped;
	}
	/**
	 * @param calificacionHuesped the calificacionHuesped to set
	 */
	public void setCalificacionHuesped(int calificacionHuesped) {
		this.calificacionHuesped = calificacionHuesped;
	}
	/**
	 * @return the dtfecha
	 */
	public DtFecha getDtfecha() {
		return dtfecha;
	}
	/**
	 * @param dtfecha the dtfecha to set
	 */
	public void setDtfecha(DtFecha dtfecha) {
		this.dtfecha = dtfecha;
	}
	/**
	 * @return the resenia
	 */
	public String getResenia() {
		return resenia;
	}
	/**
	 * @param resenia the resenia to set
	 */
	public void setResenia(String resenia) {
		this.resenia = resenia;
	}
	
	

}
