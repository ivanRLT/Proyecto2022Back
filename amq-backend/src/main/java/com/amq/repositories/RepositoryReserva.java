package com.amq.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.amq.datatypes.DtIdValor;
import com.amq.model.Reserva;

public interface RepositoryReserva extends JpaRepository<Reserva, Integer> {

	
	@Query("SELECT DISTINCT new com.amq.datatypes.DtIdValor( 1 , '1' ) "
			+ "from Huesped hu "
			+ "join hu.reservas res "
			+ "join res.habitacion hab "
			+ "where "
				+ "hu.id= :#{#idHu} and "
				+ "hab.id= :#{#idHab} "
		)
	public List<DtIdValor> usrTieneReservaEnAlojamiento(@Param("idHab") int idHab, @Param("idHu") int idHu); 
}
