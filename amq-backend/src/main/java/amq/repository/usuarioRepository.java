package amq.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.amq.model.Usuario;

public interface usuarioRepository extends JpaRepository<Usuario, Integer>{
	
}
