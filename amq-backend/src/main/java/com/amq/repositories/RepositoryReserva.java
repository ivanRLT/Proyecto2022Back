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
				+ "hab.id= :#{#idHab} and "
				+ "res.estado in ('PENDIENTE','APROBADO') "
		)
	public List<DtIdValor> usrTieneReservaEnAlojamiento(@Param("idHab") int idHab, @Param("idHu") int idHu);
	
	@Query("SELECT DISTINCT new com.amq.datatypes.DtIdValor( 1 , '1' ) "
			+ "from Huesped hu "
			+ "join hu.reservas res "
			+ "join res.habitacion hab "
			+ "where "
				+ "hu.id= :#{#idHu} and "
				+ "hab.id= :#{#idHab} and "
				+ "res.estado in ('EJECUTADA') "
			)
	public List<DtIdValor> usrSeQuedoEnAlojamiento(@Param("idHab") int idHab, @Param("idHu") int idHu);
	
	@Query("SELECT res "
			+ "from Anfitrion anf "
			+ "join anf.alojamientos alojs "
			+ "join alojs.habitaciones habs "
			+ "join habs.reservas res "
			+ "where "
				+ "res.estado in ('EJECUTADA')  "
				+ "and anf.id = :#{#idAnf} "
			)
	public List<Reserva> reservasEjecutadasAnf(@Param("idAnf") int idAnf);
	
	@Query("SELECT res "
			+ "from Huesped hu "
			+ "join hu.reservas res "
			+ "join res.habitacion hab "
			+ "where "
				+ "hu.id= :#{#idHu} and "
				+ "res.estado in ('APROBADO') "
		)
	public List<Reserva> reservasAprobadasHuesp(@Param("idHu") int idHu);
	
	@Query("SELECT res "
			+ "from Anfitrion anf "
			+ "join anf.alojamientos alojs "
			+ "join alojs.habitaciones habs "
			+ "join habs.reservas res "
			+ "where "
				+ "habs.id = :#{#idHabs} "
			)
	public List<Reserva> reservasHabitacion(@Param("idHabs") int idHabs);
	
	@Query("SELECT res "
			+ "from Anfitrion anf "
			+ "join anf.alojamientos alojs "
			+ "join alojs.habitaciones habs "
			+ "join habs.reservas res "
			+ "where "
				+ "alojs.id = :#{#idAloj} "
			)
	public List<Reserva> reservasAlojamiento(@Param("idAloj") int idAloj);
}
