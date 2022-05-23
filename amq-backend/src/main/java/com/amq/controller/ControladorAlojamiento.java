package com.amq.controller;

import java.util.List;

import com.amq.datatypes.DtAlojamiento;
import com.amq.datatypes.DtHabitacion;
import com.amq.model.Alojamiento;
import com.amq.icontroller.IcAlojamiento;

public class ControladorAlojamiento implements IcAlojamiento {
	// #######################Funciones de alojamiento#######################
	public Alojamiento altaAlojamiento(DtAlojamiento alojamiento, List<DtHabitacion> habitaciones) {
		try {
			
		} catch (Exception e) {

		}
		return null;
	}
	public boolean modificarAlojamiento() {
		Boolean retorno = false;
		try {
			
		} catch (Exception e) {
			retorno = false;
		}	
		return retorno;
	}
	public void buscarAlojamiento(int id) {
		
		try {

		} catch (Exception e) {
			// TODO: handle exception
		}	
		//return dtAlojamiento
	}
	public Boolean desactivarAlojamiento() {
		Boolean retorno = false;
		try {

			
		} catch (Exception e) {
			retorno = false;
		}	
		return retorno;
	}
	public DtAlojamiento listarAlojamientos() {
		try {
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	// #######################Funciones de habitacion#######################
	public Boolean agregarHabitaciones(int idAlojamiento, List<DtHabitacion> dtHabitacion) {
		Boolean retorno = false;
		try {

			retorno = true;
		} catch (Exception e) {
			retorno = false;
		}
		return retorno;
	}
	public DtHabitacion consultaHabitacion(int idAlojamiento, int idHabitacion) {
		try {	
			
		} catch (Exception e) {
		}
		return null;
	}
	public List<DtHabitacion> listarHabitaciones(int idAlojamiento) {
		try {

		} catch (Exception e) {

		}
		return null;
	}
	public Boolean modificarHabitaciones(int idAlojamiento, List<DtHabitacion> dtHabitacion) {
		Boolean retorno = false;
		try {
			
			retorno = true;
		} catch (Exception e) {
			retorno = false;
		}
		return retorno;
	}
}
