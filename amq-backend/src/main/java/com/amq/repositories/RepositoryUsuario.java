package com.amq.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.amq.model.Usuario;

public interface RepositoryUsuario extends JpaRepository<Usuario, Long> {

}

