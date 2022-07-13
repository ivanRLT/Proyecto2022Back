package com.amq.repositories;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.amq.datatypes.DtResena;
import com.amq.model.Calificacion;

public interface RepositoryCalificacion extends JpaRepository<Calificacion, Integer> {
	
	@Query("SELECT DISTINCT new com.amq.datatypes.DtResena( cal.id, cal.resena, cal.calificacionHuesped, cal.calificacionAnfitrion, cal.fechaResena ) "
			+ "from Alojamiento a "
			+ "join a.habitaciones habs "
			+ "join habs.reservas r "
			+ "join r.calificacion cal "
			+ "where "
				+ "a.id= :#{#idAloj} and "
				+ "cal.fechaResena BETWEEN :fechaIni AND :fechaFin and "
				+ "(:calAnfitrion=0 OR cal.calificacionAnfitrion = :calAnfitrion ) AND "
				+ "( :calHuesped=0 OR cal.calificacionHuesped = :calHuesped ) ")
	public List<DtResena> getResenasEnAlojamiento(
			@Param("idAloj") int idAloj, 
			@Param("fechaIni") Date fechaIni,
			@Param("fechaFin") Date fechaFin,
			@Param("calAnfitrion") int calAnfitrion,
			@Param("calHuesped") int calHuesped
		); 
	
	@Query("SELECT DISTINCT new com.amq.datatypes.DtResena( cal.id, cal.resena, cal.calificacionHuesped, cal.calificacionAnfitrion, cal.fechaResena ) "
			+ "from Alojamiento a "
			+ "join a.habitaciones habs "
			+ "join habs.reservas r "
			+ "join r.calificacion cal "
			+ "where "
				+ "a.id= :#{#idAloj} and "
				+ "cal.fechaResena BETWEEN :fechaIni AND :fechaFin and "
				+ "(:calAnfitrion=0 OR cal.calificacionAnfitrion = :calAnfitrion ) AND "
				+ "( :calHuesped=0 OR cal.calificacionHuesped = :calHuesped ) ")
	public List<DtResena> getAnfitrionCalificacion(
			@Param("idAloj") int idAloj, 
			@Param("fechaIni") Date fechaIni,
			@Param("fechaFin") Date fechaFin,
			@Param("calAnfitrion") int calAnfitrion,
			@Param("calHuesped") int calHuesped
		);
}
