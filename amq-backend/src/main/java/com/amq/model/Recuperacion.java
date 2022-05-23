package com.amq.model;

import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.amq.datatypes.DtFecha;

@Entity
@Table(name = "recuperaciones")
public class Recuperacion {
	@Id
	private int id;
	private Date fecha;

	public Recuperacion() {
		super();
	}

	public Recuperacion(int id, DtFecha fecha) {
		super();
		this.id = id;
		Calendar calendar = Calendar.getInstance();
		calendar.set(fecha.getAnio(), fecha.getMes(), fecha.getDia(), 00, 00, 00);
		this.fecha =(Date) calendar.getTime();
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
        DateFormat stranio = new SimpleDateFormat("yyyy");  
        String anio = stranio.format(this.fecha);  
        DateFormat strmes = new SimpleDateFormat("mm");  
        String mes = strmes.format(this.fecha);  
        DateFormat strdia = new SimpleDateFormat("dd");  
        String dia = strdia.format(this.fecha);
        int anior = Integer.parseInt(anio);
        int mesr = Integer.parseInt(mes);
        int diar = Integer.parseInt(dia);
        DtFecha retorno = new DtFecha(diar,mesr,anior);
		return retorno;
	}
	public void setFecha(DtFecha fecha) {
		Calendar calendar = Calendar.getInstance();
		calendar.set(fecha.getAnio(), fecha.getMes(), fecha.getDia(), 00, 00, 00);
		this.fecha =(Date) calendar.getTime();
	}
}
