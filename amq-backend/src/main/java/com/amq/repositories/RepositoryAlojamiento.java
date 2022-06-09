package com.amq.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.amq.datatypes.DtIdValor;
import com.amq.model.Alojamiento;

public interface RepositoryAlojamiento extends JpaRepository<Alojamiento, Integer> {

	
}
