package com.amq.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amq.model.Usuario;
import amq.repository.usuarioRepository;

@Service
public class usuarioServicioImp {
	
	@Autowired
	private usuarioRepository uRepo;
	
	public void agregarUsuario(Usuario usuario) {
		uRepo.save(usuario);
	}

	public List<Usuario> listarUsuarios() {
		List<Usuario> usuarios = uRepo.findAll();
	       return usuarios;
	}

	public Usuario buscarUsuario(int id) {
		return uRepo.getOne(id);
	}

	public void modificarUsuario(Usuario usuario) {
		// TODO Auto-generated method stub
		
	}
	
}
