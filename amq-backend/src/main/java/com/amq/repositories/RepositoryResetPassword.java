package com.amq.repositories;

import java.util.Date;
import java.util.stream.Stream;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.amq.model.PasswordResetToken;
import com.amq.model.Usuario;

public interface RepositoryResetPassword extends JpaRepository<PasswordResetToken, Integer>{
	//public Optional<PasswordResetToken> findUserByEmail(String resetTocken);
	
	PasswordResetToken findByToken(String token);
	
//	PasswordResetToken findByUser(Usuario user);
	
	Stream<PasswordResetToken> findAllByExpiryDateLessThan(Date now);
	
	 void deleteByExpiryDateLessThan(Date now);
	 
	 @Modifying
	 @Query("delete from PasswordResetToken t where t.expiryDate <= ?1")
	 void deleteAllExpiredSince(Date now);

}
