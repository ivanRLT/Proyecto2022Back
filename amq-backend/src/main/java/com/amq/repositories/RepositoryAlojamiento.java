package com.amq.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.amq.model.Alojamiento;

public interface RepositoryAlojamiento extends JpaRepository<Alojamiento, Long> {
	
}
