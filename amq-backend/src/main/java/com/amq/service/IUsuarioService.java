package com.amq.service;

import java.util.Optional;

import org.springframework.stereotype.Service;

import com.amq.model.Usuario;

@Service
public interface IUsuarioService {
	
	Usuario findUserByEmail(String email);
	
//	void createPasswordResetTokenForUser(Optional<Usuario> user, String token);

	void createPasswordResetTokenForUser(Usuario user, String token);
	
	 String validatePasswordResetToken(String token);
	 
	 Optional<Usuario> getUserByPasswordResetToken(String token);
	 
	 Usuario getUserByPassResetToken(String token);
	 
	 void changeUserPassword(Usuario user, String password);

}
