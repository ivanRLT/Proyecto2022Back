package com.amq.model;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Column;

@Entity
@Table(name = "usuarios")
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
public abstract class Usuario implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String email;
	
	private Boolean activo;
	
	private Boolean bloqueado;
	
	private String apellido;
	
	private String nombre;
	
	@OneToOne   
	@JoinColumn(name = "user_id")
	private Recuperacion recuperacion;
	
	@Column(length = 60)
	private String pass;

	public Usuario() {
		super();
	}
	public Usuario(String email, Boolean activo, Boolean bloqueado,String apellido, String nombre, String pass) {
		this.email = email;
		this.activo = activo;
		this.bloqueado = bloqueado;
		this.apellido = apellido;
		this.nombre = nombre;
		this.pass = pass;
	}
	
	public int getId() {
		return id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	public Boolean getActivo() {
		return activo;
	}
	public void setActivo(Boolean activo) {
		this.activo = activo;
	}
	public String getApellido() {
		return apellido;
	}
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public Recuperacion getRecuperacion() {
		return recuperacion;
	}
	public void setRecuperacion(Recuperacion recuperacion) {
		this.recuperacion = recuperacion;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	public Boolean getBloqueado() {
		return bloqueado;
	}
	public void setBloqueado(Boolean bloqueado) {
		this.bloqueado = bloqueado;
	}
	@Override
	public int hashCode() {
		return Objects.hash(activo, bloqueado, email, id, nombre, pass, recuperacion);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (!(obj instanceof Usuario))
			return false;
		Usuario other = (Usuario) obj;
		return Objects.equals(activo, other.activo)&&Objects.equals(bloqueado, other.bloqueado) && Objects.equals(apellido, other.apellido)
				&& Objects.equals(email, other.email) && id == other.id && Objects.equals(nombre, other.nombre)
				&& Objects.equals(pass, other.pass) && Objects.equals(recuperacion, other.recuperacion);
	}
	@Override
	public String toString() {
		return "Usuario [id=" + id + ", email=" + email + ", activo=" + activo + ", bloqueado=" + bloqueado + ", apellido=" + apellido + ", nombre="
				+ nombre + ", recuperacion=" + recuperacion + ", pass=" + pass + "]";
	}
	
	
}