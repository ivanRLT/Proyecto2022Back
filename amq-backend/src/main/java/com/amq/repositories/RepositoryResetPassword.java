package com.amq.repositories;

import java.util.Date;
import java.util.stream.Stream;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import com.amq.model.PasswordResetToken;

public interface RepositoryResetPassword extends JpaRepository<PasswordResetToken, Integer>{
	
	PasswordResetToken findByToken(String token);
	
	Stream<PasswordResetToken> findAllByExpiryDateLessThan(Date now);
	
	void deleteByExpiryDateLessThan(Date now);
	 
	@Transactional
	@Modifying
	@Query("delete from PasswordResetToken t where t.expiryDate <= now()")
	void limpiarVencidos();


}
