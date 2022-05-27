package com.amq.service;

import com.amq.model.Usuario;

public interface IUsuarioService {
	
	Usuario findUserByEmail(String email);
	
	void createPasswordResetTokenForUser(Usuario user, String token);

}
