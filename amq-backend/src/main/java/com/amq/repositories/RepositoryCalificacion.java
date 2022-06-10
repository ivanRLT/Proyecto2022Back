package com.amq.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.amq.datatypes.DtIdValor;
import com.amq.model.Calificacion;

public interface RepositoryCalificacion extends JpaRepository<Calificacion, Integer> {
	
	@Query("SELECT DISTINCT new com.amq.datatypes.DtIdValor( 0, '1' ) "
			+ "from Alojamiento a "
			+ "join a.habitaciones habs "
			+ "join habs.reservas r "
			+ "join r.calificacion cal "
			+ "where a.id= :#{#idAloj}")
	public List<DtIdValor> getCalificacionEnAlojamiento(@Param("idAloj") int idAloj); 
}
