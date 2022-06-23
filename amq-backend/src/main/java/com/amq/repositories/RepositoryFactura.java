package com.amq.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.amq.model.Factura;

public interface RepositoryFactura extends JpaRepository<Factura, Integer> {
	@Query("SELECT hu.id "
			+ "from Huesped hu "
			+ "join hu.reservas res "
			+ "join res.facturas fac "
			+ "where "
				+ "fac.id = :idFac "
			)
	public Integer findIdHuespedFactura(@Param("idFac") int idFac);
	
	@Query("SELECT anf.id "
			+ "from Anfitrion anf "
			+ "join anf.alojamientos aloj "
			+ "join aloj.habitaciones habs "
			+ "join habs.reservas res "
			+ "join res.facturas fac "
			+ "where "
				+ "fac.id = :idFac "
			)
	public Integer findIdAnfitrionFactura(@Param("idFac") int idFac);
}
