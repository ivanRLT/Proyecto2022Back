package com.amq.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import com.amq.datatypes.DtIdValor;
import com.amq.datatypes.DtPais;

public interface RepositoryPais extends JpaRepository<DtPais, Integer> {
	
	//@Query("SELECT new map(d.pais, d.pais) from DtDireccion d ")
	@Query("SELECT DISTINCT new com.amq.datatypes.DtIdValor( p.id, p.nombre ) from DtPais p ORDER BY p.nombre ")
	public List<DtIdValor> getNombresPaises();
	
	@Query("SELECT DISTINCT new com.amq.datatypes.DtIdValor( p.id, p.nombre ) "
			+ "from Alojamiento a "
			+ "join a.direccion d "
			+ "join d.pais p ORDER BY p.nombre")
	public List<DtIdValor> getPaisesEnAlojamiento();
	
}
