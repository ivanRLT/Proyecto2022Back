package amq.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.amq.model.Usuario;

@Repository
public interface usuarioRepository extends JpaRepository<Usuario, Integer>{
	
}
