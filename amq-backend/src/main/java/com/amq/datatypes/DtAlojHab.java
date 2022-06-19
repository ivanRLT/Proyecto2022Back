package com.amq.datatypes;

import java.util.List;

import com.amq.model.Alojamiento;
import com.amq.model.Habitacion;

public class DtAlojHab {
	private Integer id;
	private Boolean activo;
	private String descripcion;
	private DtDireccion direcion;
	private String nombre;
	private DtHabitacion habitacion;
	
	public DtAlojHab(Alojamiento aloj, Habitacion hab ) {
		super();
		this.id = aloj.getId();
		this.activo = aloj.getActivo();
		this.descripcion = aloj.getDescripcion();
		this.direcion = aloj.getDireccion();
		this.nombre = aloj.getNombre();
		DtHabitacion dtHab = new DtHabitacion(
				hab.getId(), 
				hab.getDescripcion(), 
				hab.getPrecioNoche(), 
				hab.getCamas(), 
				hab.getServicios()
			);
		this.habitacion = dtHab;
	}
	
	public DtAlojHab(Integer id, Boolean activo, String descripcion, DtDireccion direcion, String nombre,
			DtHabitacion habitacion) {
		super();
		this.id = id;
		this.activo = activo;
		this.descripcion = descripcion;
		this.direcion = direcion;
		this.nombre = nombre;
		this.habitacion = habitacion;
	}
	
	public Integer getId() {
		return id;
	}

	public Boolean getActivo() {
		return activo;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public DtDireccion getDirecion() {
		return direcion;
	}

	public String getNombre() {
		return nombre;
	}

	public DtHabitacion getHabitacion() {
		return habitacion;
	}

	
	
}
