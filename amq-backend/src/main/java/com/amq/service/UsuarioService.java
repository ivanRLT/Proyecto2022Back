package com.amq.service;

import java.util.Calendar;
import java.util.Optional;

//import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.amq.model.Usuario;
import com.amq.repositories.RepositoryResetPassword;
import com.amq.repositories.RepositoryUsuario;
import com.amq.model.PasswordResetToken;

@Service
//@Transactional
public class UsuarioService implements IUsuarioService{
	
	@Autowired
	private RepositoryUsuario repositoryUsuario;
	
	@Autowired
	private RepositoryResetPassword passwordTokenRepository;
	
	@Autowired(required = false)
//    private PasswordEncoder passwordEncoder;
	private String password;
	
	@Override
	public Usuario findUserByEmail(String email) {
		return repositoryUsuario.findByEmail(email);
	}
	
	@Override
    public void createPasswordResetTokenForUser(Usuario user, String token) {
        PasswordResetToken myToken = new PasswordResetToken(token, user);
        passwordTokenRepository.save(myToken);
    }
	
	@Override
    public String validatePasswordResetToken(String token) {
        final PasswordResetToken passToken = passwordTokenRepository.findByToken(token);

        return !isTokenFound(passToken) ? "invalidToken"
                : isTokenExpired(passToken) ? "expired"
                : null;
    }
	
	private boolean isTokenFound(PasswordResetToken passToken) {
        return passToken != null;
    }
	
	private boolean isTokenExpired(PasswordResetToken passToken) {
        final Calendar cal = Calendar.getInstance();
        return passToken.getExpiryDate().before(cal.getTime());
    }
	
	@Override
    public Optional<Usuario> getUserByPasswordResetToken(final String token) {
        return Optional.ofNullable(passwordTokenRepository.findByToken(token) .getUsuario());
    }
	
	@Override
    public Usuario getUserByPassResetToken(final String token) {
        return passwordTokenRepository.findByToken(token) .getUsuario();
    }
	
	@Override
    public void changeUserPassword(final Usuario user, final String password) {
//        user.setPass(passwordEncoder.encode(password));
		user.setPass(password);
        repositoryUsuario.save(user);
    }

}
