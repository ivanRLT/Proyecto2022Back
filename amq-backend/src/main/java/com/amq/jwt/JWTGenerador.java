package com.amq.jwt;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;

import com.amq.model.Administrador;
import com.amq.model.Anfitrion;
import com.amq.model.Usuario;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

public class JWTGenerador {
	/** Roles definidos:
	 * ROLE_AD
	 * ROLE_HU
	 * ROLE_AN 
	 * @param usr
	 * @return
	 */
	public static String getJWTToken(Usuario usr) {
		String secretKey = "mySecretKeymySecretKeymySecretKeymySecretKeymySecretKeymySecretKeymySecretKeymySecretKeymySecretKey";
		
		String rol_usuario;
		
		if(usr == null) {
			return null;
		}
		if( usr instanceof Administrador) {
			rol_usuario = "ROLE_AD";
		}
		else if(usr instanceof Anfitrion) {
			rol_usuario = "ROLE_AN";
		}
		else {
			rol_usuario = "ROLE_HU";
		}
		
		List<GrantedAuthority> grantedAuthorities = AuthorityUtils
				.commaSeparatedStringToAuthorityList(rol_usuario);
		
		@SuppressWarnings("deprecation")
		String token = Jwts
				.builder()
				.setId("softtekJWT")
				.setSubject(usr.getEmail())
				.claim("authorities",
						grantedAuthorities.stream()
								.map(GrantedAuthority::getAuthority)
								.collect(Collectors.toList()))
				.setIssuedAt(new Date(System.currentTimeMillis()))
				.setExpiration(new Date(System.currentTimeMillis() + 1200000)) //120 mins.
				.signWith(SignatureAlgorithm.HS512,
						secretKey.getBytes()).compact();

		return "Bearer " + token;
	}
}
