package com.amq.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.amq.datatypes.DtServicios;

public interface RepositoryServicios extends JpaRepository<DtServicios, Integer> {

}
