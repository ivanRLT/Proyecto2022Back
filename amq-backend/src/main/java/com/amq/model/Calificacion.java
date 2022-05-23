package com.amq.model;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.amq.datatypes.DtFecha;

@Entity
@Table(name = "calificaciones")
public class Calificacion {
	@Id
	private int id;
	private int calificacionAnfitrion;
	private int calificacionHuesped;
	private String resena;
	private Date fechaResena;
	
	public Calificacion() {
		super();
	}
	public Calificacion(int id, int calificacionAnfitrion, int calificacionHuesped, String resena, DtFecha fecha) {
		super();
		this.id = id;
		this.calificacionAnfitrion = calificacionAnfitrion;
		this.calificacionHuesped = calificacionHuesped;
		this.resena = resena;
		Calendar calendar = Calendar.getInstance();
		calendar.set(fecha.getAnio(), fecha.getMes(), fecha.getDia(), 00, 00, 00);
		this.fechaResena =(Date) calendar.getTime();
	}
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
        public int getId() {
        return id;
    }
	public void setId(int id) {
		this.id = id;
	}
	public int getCalificacionAnfitrion() {
		return calificacionAnfitrion;
	}
	public void setCalificacionAnfitrion(int calificacionAnfitrion) {
		this.calificacionAnfitrion = calificacionAnfitrion;
	}
	public int getCalificacionHuesped() {
		return calificacionHuesped;
	}
	public void setCalificacionHuesped(int calificacionHuesped) {
		this.calificacionHuesped = calificacionHuesped;
	}
	public String getResena() {
		return resena;
	}
	public void setResena(String resena) {
		this.resena = resena;
	}
	public DtFecha getFechaResena() {
		DateFormat stranio = new SimpleDateFormat("yyyy");  
        String anio = stranio.format(this.fechaResena);  
        DateFormat strmes = new SimpleDateFormat("mm");  
        String mes = strmes.format(this.fechaResena);  
        DateFormat strdia = new SimpleDateFormat("dd");  
        String dia = strdia.format(this.fechaResena);
        int anior = Integer.parseInt(anio);
        int mesr = Integer.parseInt(mes);
        int diar = Integer.parseInt(dia);
        DtFecha retorno = new DtFecha(diar,mesr,anior);
		return retorno;
	}
	public void setFechaResena(DtFecha fechaResena) {
		Calendar calendar = Calendar.getInstance();
		calendar.set(fechaResena.getAnio(), fechaResena.getMes(), fechaResena.getDia(), 00, 00, 00);
		this.fechaResena =(Date) calendar.getTime();
	}
}
