package com.amq.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.amq.model.Usuario;

public interface RepositoryUsuario extends JpaRepository<Usuario, Integer> {
	Usuario findByEmail(String email);

}

