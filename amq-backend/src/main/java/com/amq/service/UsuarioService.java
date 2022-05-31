package com.amq.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amq.model.Usuario;
import com.amq.repositories.RepositoryResetPassword;
import com.amq.repositories.RepositoryUsuario;
import com.amq.model.PasswordResetToken;

@Service
@Transactional
public class UsuarioService implements IUsuarioService{
	
	@Autowired
	private RepositoryUsuario repositoryUsuario;
	
	@Autowired
	private RepositoryResetPassword passwordTokenRepository;
	
	@Override
	public Usuario findUserByEmail(String email) {
		return repositoryUsuario.findByEmail(email);
	}
	
	@Override
    public void createPasswordResetTokenForUser(Usuario user, String token) {
        PasswordResetToken myToken = new PasswordResetToken(token, user);
        passwordTokenRepository.save(myToken);
    }

}
