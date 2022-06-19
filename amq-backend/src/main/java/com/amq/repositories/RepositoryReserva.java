package com.amq.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.amq.datatypes.DtIdValor;
import com.amq.datatypes.DtReservaAlojamiento;
import com.amq.datatypes.DtXY;
import com.amq.enums.ReservaEstado;
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
	
	/*@Query("SELECT new com.amq.datatypes.DtXY( "
					+ "CONCAT( year(facs.fecha), '-', month(facs.fecha) ) ,"
					+ "COUNT(1)*1.0 "
				+ ") "
			+ "from Reserva res "
			+ "join res.facturas facs "
			+ "where "
				+ "year(facs.fecha) >= :anioIni and "
				+ "month(facs.fecha) >= :mesIni and "
				+ "year(facs.fecha) <= :anioFin and "
				+ "month(facs.fecha) <= :mesFin and "
				+ "res.estado in ('EJECUTADA')  and "
				+ "facs.estado in ('REALIZADO') "
			+ "GROUP BY year(facs.fecha), month(facs.fecha) "
			)
	public List<DtXY> estadisticaResXMes(
			@Param("anioIni") int anioIni , @Param("mesIni") int mesIni,  
			@Param("anioFin") int anioFin, @Param("mesFin") int mesFin
		);*/

	@Query("SELECT COALESCE( count(1), 0) "
	+ "from Reserva res "
	+ "join res.facturas facs "
	+ "where "
		+ "year(fecha) = :anio and "
		+ "month(facs.fecha) = :mes and "
		+ "res.estado in ('EJECUTADA')  and "
		+ "facs.estado in ('REALIZADO') "
	)
	public Integer estadisticaResXMes( @Param("anio") int anio , @Param("mes") int mes );
	
	@Query("SELECT new com.amq.datatypes.DtReservaAlojamiento( res, aloj, hab) "
			+ "FROM Huesped hu "
			+ "JOIN hu.reservas res "
			+ "JOIN res.habitacion hab "
			+ "JOIN res.calificacion cal "
			+ "JOIN hab.alojamiento aloj "
			+ "WHERE "
				+ "res.estado in (:estados) AND "
				+ "hu.id = :idHu "
			)
	public List<DtReservaAlojamiento> findReservasXHuespConEstado( @Param("idHu") int idHu , @Param("estados")List<ReservaEstado> estados);
	
	@Query("SELECT res "
			+ "from Anfitrion anf "
			+ "join anf.alojamientos alojs "
			+ "join alojs.habitaciones habs "
			+ "join habs.reservas res "
			+ "where "
				+ "res.estado in ('APROBADO', 'PENDIENTE' )  "
				+ "and anf.id = :idAnf "
			)
	public List<Reserva> reservasPendientesYAprobadas(@Param("idAnf") int idAnf);
	
}
