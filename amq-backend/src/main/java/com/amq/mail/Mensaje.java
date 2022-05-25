package com.amq.mail;

public class Mensaje {
	private String de;
	private String destinatario;
	private String cuerpo;
	private String asunto;
	
	public Mensaje(String de, String destinatario, String cuerpo, String asunto) {
		super();
		this.de = de;
		this.destinatario = destinatario;
		this.cuerpo = cuerpo;
		this.asunto = asunto;
	}
	
	public void setDe(String de) {
		this.de = de;
	}

	public void setDestinatario(String destinatario) {
		this.destinatario = destinatario;
	}

	public void setCuerpo(String cuerpo) {
		this.cuerpo = cuerpo;
	}

	public void setAsunto(String asunto) {
		this.asunto = asunto;
	}

	public String getDe() {
		return de;
	}
	public String getDestinatario() {
		return destinatario;
	}
	public String getCuerpo() {
		return cuerpo;
	}
	public String getAsunto() {
		return asunto;
	}
	
	
}
