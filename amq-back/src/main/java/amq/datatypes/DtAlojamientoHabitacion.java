package amq.datatypes;

import java.util.ArrayList;
import java.util.List;

import amq.entidades.Alojamiento;
import amq.entidades.Habitacion;

public class DtAlojamientoHabitacion {
	
	private boolean aloj_activo;
	private String aloj_descripcion;
	private String aloj_direcion;
	private String aloj_nombre;
	private String hab_descripcion;
	private Double hab_precioNoche;
	private int hab_camas;
	private boolean aire;
	private boolean tvCable;
	private boolean jacuzzi;
	private boolean wifi;
	private boolean desayuno;
	private boolean parking;
	
	
	
	public DtAlojamientoHabitacion(boolean aloj_activo, String aloj_descripcion, String aloj_direcion,
			String aloj_nombre, String hab_descripcion, Double hab_precioNoche, int hab_camas, boolean aire,
			boolean tvCable, boolean jacuzzi, boolean wifi, boolean desayuno, boolean parking) {
		super();
		this.aloj_activo = aloj_activo;
		this.aloj_descripcion = aloj_descripcion;
		this.aloj_direcion = aloj_direcion;
		this.aloj_nombre = aloj_nombre;
		this.hab_descripcion = hab_descripcion;
		this.hab_precioNoche = hab_precioNoche;
		this.hab_camas = hab_camas;
		this.aire = aire;
		this.tvCable = tvCable;
		this.jacuzzi = jacuzzi;
		this.wifi = wifi;
		this.desayuno = desayuno;
		this.parking = parking;
	}
	
	public boolean isAloj_activo() {
		return aloj_activo;
	}
	public void setAloj_activo(boolean aloj_activo) {
		this.aloj_activo = aloj_activo;
	}
	public String getAloj_descripcion() {
		return aloj_descripcion;
	}
	public void setAloj_descripcion(String aloj_descripcion) {
		this.aloj_descripcion = aloj_descripcion;
	}
	public String getAloj_direcion() {
		return aloj_direcion;
	}
	public void setAloj_direcion(String aloj_direcion) {
		this.aloj_direcion = aloj_direcion;
	}
	public String getAloj_nombre() {
		return aloj_nombre;
	}
	public void setAloj_nombre(String aloj_nombre) {
		this.aloj_nombre = aloj_nombre;
	}
	public String getHab_descripcion() {
		return hab_descripcion;
	}
	public void setHab_descripcion(String hab_descripcion) {
		this.hab_descripcion = hab_descripcion;
	}
	public Double getHab_precioNoche() {
		return hab_precioNoche;
	}
	public void setHab_precioNoche(Double hab_precioNoche) {
		this.hab_precioNoche = hab_precioNoche;
	}
	public int getHab_camas() {
		return hab_camas;
	}
	public void setHab_camas(int hab_camas) {
		this.hab_camas = hab_camas;
	}
	public boolean isAire() {
		return aire;
	}
	public void setAire(boolean aire) {
		this.aire = aire;
	}
	public boolean isTvCable() {
		return tvCable;
	}
	public void setTvCable(boolean tvCable) {
		this.tvCable = tvCable;
	}
	public boolean isJacuzzi() {
		return jacuzzi;
	}
	public void setJacuzzi(boolean jacuzzi) {
		this.jacuzzi = jacuzzi;
	}
	public boolean isWifi() {
		return wifi;
	}
	public void setWifi(boolean wifi) {
		this.wifi = wifi;
	}
	public boolean isDesayuno() {
		return desayuno;
	}
	public void setDesayuno(boolean desayuno) {
		this.desayuno = desayuno;
	}
	public boolean isParking() {
		return parking;
	}
	public void setParking(boolean parking) {
		this.parking = parking;
	}
	
	
	
}
