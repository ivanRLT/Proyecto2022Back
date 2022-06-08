package com.amq.datatypes;

public class DtIdValor {
	private int id;
	private String valor;
	
	public DtIdValor(int id, String valor) {
		super();
		this.id = id;
		this.valor = valor;
	}
	
	public DtIdValor() {
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getValor() {
		return valor;
	}

	public void setValor(String valor) {
		this.valor = valor;
	}
	
	
}
