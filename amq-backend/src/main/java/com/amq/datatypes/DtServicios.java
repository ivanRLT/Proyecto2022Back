package com.amq.datatypes;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class DtServicios implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private boolean aire;
	private boolean tvCable;
	private boolean jacuzzi;
	private boolean wifi;
	private boolean desayuno;
	private boolean parking;
	
	public DtServicios(boolean aire, boolean tvCable, boolean jacuzzi, boolean wifi, boolean desayuno,
			boolean parking) {
		super();
		this.aire = aire;
		this.tvCable = tvCable;
		this.jacuzzi = jacuzzi;
		this.wifi = wifi;
		this.desayuno = desayuno;
		this.parking = parking;
	}
	public int getId() {
        return id;
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
