package com.amq.icontroller;

import java.util.List;

import com.amq.datatypes.DtAlojamiento;
import com.amq.datatypes.DtReserva;
import com.amq.datatypes.DtUsuario;

public interface IcUsuario {
	public boolean altaUsuario(DtUsuario usuario);
	public boolean modificarUsuario();
	public void buscarUsuario(int id, String email);
	public boolean desactivarUsuario();
	public List<DtUsuario> listarUsuarios ();
	public boolean agregarAlojamientoAnfitrion();
	public List<DtAlojamiento> listarAlojamientosAnfitrion();
	public boolean cambiarEstadoAnfitrion();
	public boolean agregarReservaHuesped();
	public List<DtReserva> listarReservasHuesped();
	public boolean modificarReservaHuesped(int idReserva);
	public DtUsuario iniciarSesion(String email, String pass);
}
