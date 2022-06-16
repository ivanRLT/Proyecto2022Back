package com.amq.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.amq.datatypes.DtCalificarDatosRequeridos;
import com.amq.datatypes.DtIdValor;
import com.amq.model.Alojamiento;

public interface RepositoryAlojamiento extends JpaRepository<Alojamiento, Integer> {

	@Query("SELECT DISTINCT new com.amq.datatypes.DtCalificarDatosRequeridos( "
				+ " aloj.id , aloj.activo, aloj.nombre, aloj.descripcion, dir.calle, "
				+ "dir.numero, dir.ciudad, pais.id, res.id , anf.id "
			+ ") "
			+ "from Huesped hu "
			+ "join hu.reservas res "
			+ "join res.habitacion hab "
			+ "join hab.alojamiento aloj "
			+ "join aloj.anfitrion anf "
			+ "join aloj.direccion dir "
			+ "join dir.pais pais "
			+ "where "
				+ "hu.id= :idHu AND "
				+ "(:idPais=0 OR  pais.id = :idPais)"
		)
	public List<DtCalificarDatosRequeridos> listarDatosRequeridosCalificar(
			@Param("idHu") int idHu
			, @Param("idPais") int idPais
		);

	
//int aloj_id, Boolean aloj_activo, String aloj_nombre, String aloj_descripcion,
//String aloj_dir_calle, String aloj_dir_numero, String aloj_dir_ciudad, String aloj_dir_idPais, int res_id,
//int anf_id
	
}
