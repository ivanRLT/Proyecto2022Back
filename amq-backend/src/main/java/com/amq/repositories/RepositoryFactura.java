package com.amq.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.amq.model.Factura;

public interface RepositoryFactura extends JpaRepository<Factura, Integer> {

}
