package amq.entidades;

public class Factura {
	private int id;
	//private EstadoPago estado; TODO
	private double monto;
	//private DtFecha fecha; TODO
	private Boolean descuento;
	private double montoDescuento;
	
	public Factura() {
		super();
	}
	public Factura(int id, double monto, Boolean descuento, double montoDescuento) {
		super();
		this.id = id;
		this.monto = monto;
		this.descuento = descuento;
		this.montoDescuento = montoDescuento;
		//this.estado = estado; TODO
		//this.fecha = fecha; TODO
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public double getMonto() {
		return monto;
	}
	public void setMonto(double monto) {
		this.monto = monto;
	}
	public Boolean getDescuento() {
		return descuento;
	}
	public void setDescuento(Boolean descuento) {
		this.descuento = descuento;
	}
	public double getMontoDescuento() {
		return montoDescuento;
	}
	public void setMontoDescuento(double montoDescuento) {
		this.montoDescuento = montoDescuento;
	}
	//TODO definir set y get estado
	//TODO definir set y get fecha
}
