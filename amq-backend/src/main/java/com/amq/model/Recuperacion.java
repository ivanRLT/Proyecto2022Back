package com.amq.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.amq.datatypes.DtFecha;

@Entity
@Table(name = "recuperaciones")
public class Recuperacion {
	@Id
	private int id;
	
	@ManyToOne
	private DtFecha fecha;

	public Recuperacion() {
		super();
	}
	public Recuperacion(int id, DtFecha fecha) {
		super();
		this.id = id;
		this.fecha = fecha;
	}
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
        public int getId() {
        return id;
    }
	public void setId(int id) {
		this.id = id;
	}
	public DtFecha getFecha() {
		return fecha;
	}
	public void setFecha(DtFecha fecha) {
		this.fecha = fecha;
	}
}
