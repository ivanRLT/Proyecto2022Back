package com.amq.jwt;

import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

@EnableWebSecurity
@Configuration
@EnableGlobalMethodSecurity(prePostEnabled = true)
class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable()
			.addFilterAfter(new JWTAuthorizationFilter(), UsernamePasswordAuthenticationFilter.class)
			.authorizeRequests()
			.antMatchers(HttpMethod.POST, "/usuario/login").permitAll()
			.antMatchers(HttpMethod.POST, "/alojamiento/desactivarAlojamiento/**").permitAll()
			.antMatchers(HttpMethod.POST, "/usuario/listar").permitAll().anyRequest().authenticated()
			.antMatchers(HttpMethod.POST, "/usuario/resetPassword").permitAll().anyRequest().authenticated()
		    .antMatchers(HttpMethod.GET, "/swagger-ui/index.html#").permitAll().anyRequest().authenticated()
		    .antMatchers(HttpMethod.GET, "http://localhost:8080/swagger-ui/index.html#").permitAll().anyRequest().authenticated();
		http.cors().disable();
	}
}