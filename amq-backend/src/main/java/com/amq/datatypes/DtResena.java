package com.amq.datatypes;

import java.util.Date;

public class DtResena {
	private int id;
	private String resena;
	private Integer calHuesp;
	private Integer calAnf;
	private Date fechaResena;
	
	public DtResena(){}
	
	public DtResena(int id, String resena, Integer calHuesp, Integer calAnf, Date fechaResena) {
		super();
		this.id = id;
		this.resena = resena;
		this.calHuesp = calHuesp;
		this.calAnf = calAnf;
		this.fechaResena = fechaResena;
	}
	
	public Date getFechaResena() {
		return fechaResena;
	}
	public void setFechaResena(Date fechaResena) {
		this.fechaResena = fechaResena;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getResena() {
		return resena;
	}
	public void setResena(String resena) {
		this.resena = resena;
	}
	public Integer getCalHuesp() {
		return calHuesp;
	}
	public void setCalHuesp(Integer calHuesp) {
		this.calHuesp = calHuesp;
	}
	public Integer getCalAnf() {
		return calAnf;
	}
	public void setCalAnf(Integer calAnf) {
		this.calAnf = calAnf;
	}
	
	
}
