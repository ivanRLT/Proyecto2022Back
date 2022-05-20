package com.aquimequedo.api.controladores;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import amq.datatypes.*;

@RestController
@RequestMapping()
public class ControladorServicio {
	@GetMapping(value= "/alojamientos")
	public List<DtAlojamiento> getAlojamientos(){
		return null;
	}
}