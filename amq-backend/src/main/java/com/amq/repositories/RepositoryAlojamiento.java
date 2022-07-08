package com.amq.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.amq.datatypes.DtAlojHab;
import com.amq.datatypes.DtCalificarDatosRequeridos;
import com.amq.model.Alojamiento;

public interface RepositoryAlojamiento extends JpaRepository<Alojamiento, Integer> {

	@Query("SELECT DISTINCT new com.amq.datatypes.DtCalificarDatosRequeridos( "
				+ " aloj.id , aloj.activo, aloj.nombre, aloj.descripcion, dir.calle, "
				+ "dir.numero, dir.ciudad, pais.id, pais.nombre, res.id , anf.id, "
				+ "cal.calificacionAnfitrion, hu.id, cal.calificacionHuesped, "
				+ "hu.nombre, "
				+ "CONCAT(YEAR(res.fechaInicio), '-', MONTH(res.fechaInicio), '-', DAY(res.fechaInicio)), "
				+ "CONCAT(YEAR(res.fechaFin), '-', MONTH(res.fechaFin), '-', DAY(res.fechaFin)) "
			+ ") "
			+ "from Huesped hu "
			+ "join hu.reservas res "
			+ "left join res.calificacion cal "
			+ "join res.habitacion hab "
			+ "join hab.alojamiento aloj "
			+ "join aloj.anfitrion anf "
			+ "join aloj.direccion dir "
			+ "join dir.pais pais "
			+ "where "
				+ "(hu.id = :idUsuario OR anf.id = :idUsuario  )AND "
				+ "(:idPais IS NULL OR :idPais=0 OR  pais.id = :idPais) AND "
				+ "(:alojActivo IS NULL OR aloj.activo = :alojActivo) AND "
				+ "res.estado = 'EJECUTADA' "
			+ " "
		)
	public List<DtCalificarDatosRequeridos> listarDatosRequeridosCalificar(
			@Param("idUsuario") Integer idUsuario
			, @Param("idPais") Integer idPais
			, @Param("alojActivo") Boolean alojActivo
		);

	
	@Query("SELECT new com.amq.datatypes.DtAlojHab(aloj, habs) "
		+ "from Alojamiento aloj "
		+ "join aloj.habitaciones habs "
		+ "where "
			+ "habs.id = :idHab "
	)
	public DtAlojHab buscarAlojHab( @Param("idHab") int idHab	);
	
}
